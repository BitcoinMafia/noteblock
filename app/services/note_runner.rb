module NoteRunner
  extend self

  def execute(transaction)
    addresses = TransactionUtils.pluck_addresses(transaction, inputs: false)
    # TODO: only pluck unpaid, unflagged
    all_notes = Note.pluck(:address)
    selected_address = addresses[0]
    note = Note.where(address: selected_address)[0]

    # Check Presence
    if !Task.address_present?(addresses, all_notes)
      return;
    end

    # Save Payment
    if !Task.save_payment(note, transaction);
      raise "NotePayment Failed"
    end

    # valid?
    if !Task.check_payment_validity(note, transaction)
      raise "Payment not valid"
    end

    # # NoteTransaction
    if !Task.create_proof(note);
      raise "Note Proof Failed"
    end

    # # Token
    if !Task.create_token(note);
      raise "Note Proof Failed"
    end

    # # Email
    if !Task.send_email(note);
      raise "Emailed Failed"
    end

    return true
  end

  module Task
    ### All methods should return BOOLEAN
    extend self

    def address_present?(addresses, notes)
      common_addresses = addresses & notes
      return common_addresses.length == 0 ? false : true
    end

    def save_payment(note, transaction)

      payment = note.note_transactions.new(
        tx_hash: transaction["tx_hash"],
        satoshis: TransactionUtils.output_value_for(transaction, note.address),
        tx_type: "payment"
      )

      return payment.save
    end

    def check_payment_validity(note, transaction)
      # TODO: send message to client

      # Amount is >= min
      if TransactionUtils.output_value_for(transaction, note.address) < NoteTransaction::MINIMUM
        p "Payment amount is < min"
        return false
      end

      # Fees >= 10000
      if transaction["fees"] < 10_000
        p "Transaction fees is < min"
        return false
      end

      # No outputs < 5400
      if TransactionUtils.low_outputs?(transaction)
        p "Some outputs < 5400"
        return false
      end

      return true
    end

    def send_to_client(note)

    end

    def create_proof(note)
      hash160s = NoteConvertor.utf8_to_hex(note.content)
      to_addresses = hash160s.map {|h| Bitcoin.hash160_to_address(h)}

      private_key = AES.decrypt(note.encrypted_private_key, ENV["DECRYPTION_KEY"])

      raw_transaction = TransactionBuilder.build(
        from_address: note.address,
        private_key: private_key,
        to_addresses: to_addresses
      )

      response = BitcoinNodeAPI::Transactions.propagate(raw_transaction[:hex])

      note_transaction = note.note_transactions.new(
        tx_hash: response["tx_hash"],
        satoshis: 22000,
        tx_type: "proof"
      )

      return note_transaction.save
    end

    def create_token(note)
      encrypted_token = AES.encrypt(Note.generate_token, ENV["DECRYPTION_KEY"])
      note.encrypted_token = encrypted_token
      note.save
    end

    def send_email(note)
      return true unless note.email

      mail = NoteMailer.index(
        email: note.email,
        sender: note.sender,
        encrypted_token: note.encrypted_token,
        note_id: note.id
      )

      # # Deliver
      mail.deliver
      return true
    end
  end
end
