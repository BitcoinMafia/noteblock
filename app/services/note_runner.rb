module NoteRunner
  extend self

  def execute(transaction)
    addresses = TransactionUtils.pluck_addresses(transaction, inputs: false)
    # TODO: only pluck unpaid, unflagged
    all_notes = Note.pluck(:address)
    selected_address = addresses[0]

    # Check Presence
    if Task.address_present?(addresses, all_notes)
      return;
    end

    # NotePayment
    if !Task.create_payment(transaction, selected_address);
      raise "NotePayment Failed"
    end

    # valid?

    # # NoteTransaction
    # if !Task.create_transaction(transaction, selected_address);
    #   raise "NoteTransaction Failed"
    # end

    # # NoteProof
    # if !Task.create_proof(transaction, selected_address);
    #   raise "NoteProof Failed"
    # end

    # # Token

    # # Email
    # if !Task.create_email(transaction, selected_address);
    #   raise "Emailed Failed"
    # end
  end

  module Task
    ### All methods should return BOOLEAN
    extend self

    def address_present?(addresses, notes)
      common_addresses = addresses & notes
      common_addresses.length == 0 ? false : true
    end

    def create_payment(transaction, address)
      note = Note.where(address: address)[0]

      payment = note.note_payment.new(
        tx_hash: transaction["tx_hash"],
        satoshis: TransactionUtils.output_value_for(transaction, address)
      )

      payment.save
    end

    def create_transaction

    end

    def create_token

    end

    def create_email

    end
  end
end
