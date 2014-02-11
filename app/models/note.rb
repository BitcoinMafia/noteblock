class Note < ActiveRecord::Base

  # VALIDATION =========================================================

  validates :content, presence: true, length: { maximum: 76 }
  validates :address, presence: true
  validates :encrypted_private_key, presence: true
  validate :private_key_encrypted

  def private_key_encrypted
    return unless encrypted_private_key

    # Check if encrypted_private_key all valid hex characters
    # This implies it has not been AES encrypted
    if !encrypted_private_key[/\H/]
      errors.add(:note_id, "Cannot store unencrypted private key")
      return false
    end
  end

  # ASSOCIATIONS =========================================================

  has_many :note_transactions

  # METHODS ==============================================================

end
