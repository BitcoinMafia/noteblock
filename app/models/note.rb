class Note < ActiveRecord::Base

  # VALIDATION =========================================================

  validates :content, presence: true, length: { maximum: 76 }
  validates :address, presence: true, uniqueness: true
  validates :encrypted_private_key, presence: true
  validates :email, email_format: { message: 'Email invalid', allow_nil: true }

  validate :private_key_encrypted
  # validate :token_encrypted

  def private_key_encrypted
    return unless encrypted_private_key

    # Check if encrypted_private_key all valid hex characters
    # This implies it has not been AES encrypted
    if !encrypted_private_key[/\H/]
      errors.add(:note_id, "Cannot store unencrypted private key")
      return false
    end
  end

  # def token_encrypted
  #   return unless encrypted_token

  #   # Check if encrypted_private_key all valid hex characters
  #   # This implies it has not been AES encrypted
  #   if !encrypted_token[/\H/]
  #     errors.add(:note_id, "Cannot store unencrypted token")
  #     return false
  #   end
  # end

  # ASSOCIATIONS =========================================================

  has_many :note_transactions

  # METHODS ==============================================================

  def self.pending
    Note.includes(:note_transactions).where(
      note_transactions: {
        note_id: nil
      }
    )
  end

  def self.initial_build(params)
    note = Note.new
    note.email = params[:email]
    note.content = params[:content]
    note.sender = params[:sender]

    # Bitcoin Key
    key = Bitcoin::Key.generate
    note.address = key.addr
    note.encrypted_private_key = AES.encrypt(key.priv, ENV["DECRYPTION_KEY"])
    return note
  end

  # Be careful about revealing the encrypted_token
  def self.retrieve(id: nil)
    note = self
      .where(id: id)
      .includes(:note_transactions)[0]

    # Payment
    total_paid = note.note_transactions.payments.sum(:satoshis)
    if total_paid >= NoteTransaction::MINIMUM
      payment_valid = true
    end

    # Note Creation
    note_hex = NoteConvertor.utf8_to_hex(note.content).join

    return {
      id: note.id,
      content: note.content,
      sender: note.sender,
      address: note.address,
      payment_valid: payment_valid || false,
      created_at: note.created_at,
      total_paid: total_paid,
      tx_hash: note.note_transactions.proofs[0].try(:tx_hash),
      note_hex: note_hex
    }
  end

  def self.claim(encrypted_token: nil, to_address: nil, amount: nil, compressed: false)
    if !encrypted_token || !to_address
      raise "missing arguments"
    end

    note = Note.where(encrypted_token: encrypted_token)[0]
    balance = BitcoinNodeAPI::Addresses.single(note.address)["balance"]
    private_key = AES.decrypt(note.encrypted_private_key, ENV["DECRYPTION_KEY"])
    amount ||= balance - NoteTransaction::MINER_FEE

    raw_transaction = TransactionBuilder.build(
      from_address: note.address,
      private_key: private_key,
      to_addresses: [to_address],
      amount: amount,
      compressed: compressed
    )

    response = BitcoinNodeAPI::Transactions.propagate(raw_transaction[:hex])

    note_transaction = note.note_transactions.new(
      tx_hash: response["tx_hash"],
      satoshis: amount,
      tx_type: "withdrawal"
    )

    return note_transaction.save
  end

  def self.generate_token
    SecureRandom.hex(64)
  end

end
