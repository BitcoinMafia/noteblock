class NoteProof < ActiveRecord::Base
  validates :tx_hash, presence: true

  validate :valid_tx_hash

  def valid_tx_hash
    return unless tx_hash

    unless tx_hash.length === 64 && !tx_hash[/\H/]
      errors.add(:note_proof_id, "Invalid tx_hash")
    end
  end

end
