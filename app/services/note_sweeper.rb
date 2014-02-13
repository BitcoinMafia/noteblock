module NoteSweeper
  extend self

  def check
    notes = Note.includes(:note_transactions).where(
      "note_transactions.tx_type = 'payment' OR note_transactions.tx_type = 'proof'")
    not_propagated = notes.map do |note|
      note if note.note_transactions.proofs.blank? && note.note_transactions.payments.sum(:satoshis) >= NoteTransaction::MINIMUM
    end

    ap "THE FOLLOWING HAVE RECEIVED PAYMENT, BUT HAVE NOT PROPAGATED/EMBEDDED MESSAGE"
    return not_propagated.compact
  end

  def finish_task_for_note(note_id)
    note = Note.where(id: note_id)[0]

    # # NoteTransaction
    if !NoteRunner::Task.create_proof(note, compressed: false);
      ap "Note Proof Failed"
      return false
    end

    # # Token
    if !NoteRunner::Task.create_token(note);
      ap "Note Proof Failed"
      return false
    end

    # # Email
    if !NoteRunner::Task.send_email(note);
      ap "Emailed Failed"
      return false
    end
  end
end
