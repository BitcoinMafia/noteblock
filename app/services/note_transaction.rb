module NoteTransaction
  # gives build_tx DSL
  extend self
  extend Bitcoin::Builder

  def build(from_address: nil, encrypted_private_key: nil, to_addresses: nil, amount: 22000, fee: 10000)
    if !from_address || !encrypted_private_key || !to_addresses || !amount || !fee
      raise "missing arguments";
    end

    raw_unspents = BitcoinNodeAPI::Addresses.unspents(from_address)
    selected_unspents = self.select_unspents(raw_unspents, amount + fee)

    private_key = AES.decrypt(encrypted_private_key, ENV["DECRYPTION_KEY"])
    key = Bitcoin::Key.from_base58(private_key)

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

        binding.pry

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

      if change_value > 0
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
      if unspent["value"] >= total_value
        return [unspent]
      end

      # Output too small
      if unspent["value"] <= 5400
        next
      end

      selected_unspents << unspent

      if selected_unspents.unspent_value >= total_value
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
