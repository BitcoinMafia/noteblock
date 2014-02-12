class Note < ActiveRecord::Base

  # VALIDATION =========================================================

  validates :content, presence: true, length: { maximum: 76 }
  validates :address, presence: true, uniqueness: true
  validates :encrypted_private_key, presence: true
  validates :email, email_format: { message: 'Email invalid', allow_nil: true }

  validate :private_key_encrypted
  validate :token_encrypted

  def private_key_encrypted
    return unless encrypted_private_key

    # Check if encrypted_private_key all valid hex characters
    # This implies it has not been AES encrypted
    if !encrypted_private_key[/\H/]
      errors.add(:note_id, "Cannot store unencrypted private key")
      return false
    end
  end

  def token_encrypted
    return unless encrypted_token

    # Check if encrypted_private_key all valid hex characters
    # This implies it has not been AES encrypted
    if !encrypted_token[/\H/]
      errors.add(:note_id, "Cannot store unencrypted token")
      return false
    end
  end

  # ASSOCIATIONS =========================================================

  has_many :note_transactions

  # METHODS ==============================================================

  def self.generate_token
    SecureRandom.hex(64)
  end

end
