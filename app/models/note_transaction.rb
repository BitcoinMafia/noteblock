class NoteTransaction < ActiveRecord::Base

  # VALIDATION =========================================================

  validates :tx_hash, presence: true
  validates :satoshis, presence: true
  validates :tx_type, presence: true

  validate :valid_tx_hash
  validate :valid_tx_type

  def valid_tx_hash
    return unless tx_hash

    unless tx_hash.length === 64 && !tx_hash[/\H/]
      errors.add(:note_transaction_id, "Invalid tx_hash")
    end
  end

  def valid_tx_type
    return unless tx_type

    allowed = ["payment", "proof", "withdrawal"]

    unless allowed.include?(tx_type)
      errors.add(:note_transaction_id, "Invalid tx_type: #{tx_type}")
    end
  end

  # ASSOCIATIONS =========================================================

  belongs_to :note

  # METHODS ==============================================================
end
