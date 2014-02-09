class Note < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 76 }
  validates :address, presence: true
  validates :encrypted_private_key, presence: true
  validate :private_key_encrypted

  def private_key_encrypted

    # Check if encrypted_private_key all valid hex characters
    # This implies it has not been AES encrypted
    if encrypted_private_key && !encrypted_private_key[/\H/]
      errors.add(:note_id, "Cannot store unencrypted private key")
      return false
    end
  end


end
