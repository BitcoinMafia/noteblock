module TransactionBuilder
  # gives build_tx DSL
  extend self
  extend Bitcoin::Builder

  def build(from_address: nil, private_key: nil, to_addresses: nil, amount: 22000, fee: 10000, compressed: false)
    if !from_address || !private_key || !to_addresses || !amount || !fee
      raise "missing arguments";
    end

    raw_unspents = BitcoinNodeAPI::Addresses.unspents(from_address)
    selected_unspents = self.select_unspents(raw_unspents, amount + fee)

    # TODO: Compressed/Uncompressed
    key = Bitcoin::Key.new(private_key, nil, compressed)

    tx_hashes = selected_unspents.map { |u| u["tx_hash"] }

    # Bitcoin-Ruby is retarded
    # Surely you don't know the whole transaction
    transactions = BitcoinNodeAPI::Transactions.batch(tx_hashes)

    new_tx = self.build_tx do |t|
      selected_unspents.each do |unspent|

        transaction = transactions.select { |tx| tx["tx_hash"] == unspent["tx_hash" ] }[0]

        prev_out_obj = Bitcoin::P::Tx.new([transaction["raw_hex"]].pack("H*"))

        t.input do |i|
          i.prev_out(prev_out_obj)
          i.prev_out_index(unspent["n"])
          i.signature_key(key)
        end

      end

      to_addresses.each do | address |
        t.output do |o|
          o.value(amount / to_addresses.length)
          o.script {|s| s.recipient(address) }
        end
      end

      # now deal with change
      unspents_total_value = selected_unspents.sum {|u| u["value"]}
      change_value = unspents_total_value - (amount + fee)

      if change_value > 5500
        t.output do |o|
          o.value(change_value)
          o.script {|s| s.recipient key.addr }
        end
      end
    end

    return {
      hex: new_tx.payload.unpack("H*").first,
      tx_hash: new_tx.hash
    }
  end

  def select_unspents(unspentsArray, total_value)
    # TODO: this is only last 20; API should return total_balance for /unspents
    total_unspents_value = unspentsArray.map {|u| u["value"]}.sum
    if total_unspents_value < total_value
      raise "Insufficient Amount: Needed #{total_value}, had #{total_unspents_value}."
    end

    selected_unspents = []

    unspentsArray.each do |unspent|
      # next unless unspent["confirmations"] > 0

      if unspent["value"] >= total_value
        return [unspent]
      end

      selected_unspents << unspent

      if selected_unspents.map {|u| u["value"]}.sum >= total_value
        return selected_unspents
      end
    end
  end

  class ::String
    def reverse_hex
      [self].pack('H*').reverse.unpack("H*").first
    end
  end

end
