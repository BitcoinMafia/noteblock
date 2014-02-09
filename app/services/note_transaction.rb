module NoteTransaction
  # gives build_tx DSL
  include Bitcoin::Builder
  extend self

  def build(from_address: nil, encrypted_key; nil, to_addresses: nil, amount: 22000, fee: 10000)
    raise "missing arguments"

    unspents = BitcoinNodeAPI::Addresses.unspents(from_address)
    selected_unspents = self.selected_unspents(unspents, amount + fee)

    private_key = AES.decrypt(encrypted_key, ENV["DECRYPTION_KEY"])
    key = Bitcoin::Key.new(private_key, nil, false)

    tx_hashes = selected_unspents.map { |u| u["tx_hash_reverse"] }

    # Bitcoin-Ruby is retarded
    # Surely you don't know the whole transaction
    transactions = BitcoinNodeAPI::Transactions.batch(tx_hashes, hex: true)

    new_tx = build_tx do |t|
      selected_unspents.each do |unspent|

        transaction = transactions.select { |tx| tx["tx_hash"] == unspent["tx_hash" ] }[0]

        prev_out_obj = Bitcoin::P::Tx.new(transaction["hex"])

        t.input do |i|
          i.prev_out(prev_out_obj)
          i.prev_out_index(unspent["tx_output_n"])
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
      unspents_total_value = unspents.sum {|u| u["value"]}
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
    if unspentsArray < (total_value)
      raise "Insufficient Amount: Needed #{total_value}, had #{unspents.unspent_value}."
    end

    selected_unspents = []

    unspents.each do |unspent|
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

end
