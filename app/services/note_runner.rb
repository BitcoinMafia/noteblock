module NoteRunner
  extend self

  def execute(transaction)
    input_addresses = TransactionUtils.pluck_input_addresses(transaction)
    output_addresses = TransactionUtils.pluck_output_addresses(transaction)

    all_addresses = Note.pending.pluck(:address)

    # Check Presence
    if !Task.payment_made?(input_addresses, output_addresses, all_addresses)
      p 'Not a Payment ...'
      return;
    end
    ap "PAYMENT MADE!"

    selected_address = (all_addresses & output_addresses)[0]
    note = Note.where(address: selected_address)[0]

    # Save Payment
    if !Task.save_payment(note, transaction);
      ap "NotePayment Failed"
      return false
    end

    # valid?
    if !Task.check_payment_validity(note, transaction)
      ap "Payment not valid"
      return false
    end

    # Push to Client
    if !Task.push_to_client(note)
      ap "Push to client failed"
      return false
    end

    # # NoteTransaction
    if !Task.create_proof(note);
      ap "Note Proof Failed"
      return false
    end

    # # Token
    if !Task.create_token(note);
      ap "Note Proof Failed"
      return false
    end

    # # Email
    if !Task.send_email(note);
      ap "Emailed Failed"
      return false
    end

    ap "FINISHED!"
    return true
  end

  module Task
    ### All methods should return BOOLEAN
    extend self

    def payment_made?(input_addresses, output_addresses, all_addresses)
      common_outputs = output_addresses & all_addresses
      return false if common_outputs.count == 0

      # Makes sure its not self send, with change
      common_inputs = input_addresses & all_addresses
      return false if common_inputs.count > 0

      return true
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
      # TODO: check previosu payments
      # TODO: send message to client

      # Amount is >= min
      if TransactionUtils.output_value_for(transaction, note.address) < NoteTransaction::MINIMUM
        ap "Payment amount is < min"
        return false
      end

      # Fees >= 10000
      if transaction["fees"] < 10_000
        ap "Transaction fees is < min"
        return false
      end

      # No outputs < 5400
      if TransactionUtils.low_outputs?(transaction)
        ap "Some outputs < 5400"
        return false
      end

      return true
    end

    def push_to_client(note)
      Pusher["notes"].trigger("latest", {
        content: note.content,
        sender: note.sender,
        created_at: note.created_at,
        satoshis: note.note_transactions.payments.sum(:satoshis)
      })

      Pusher["confirm"].trigger(note.address, {
        payment_valid: true
      })

      return true
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
      return true if !note.encrypted_token.nil?

      # encrypted_token = AES.encrypt(Note.generate_token, ENV["DECRYPTION_KEY"])
      note.encrypted_token = Note.generate_token
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
