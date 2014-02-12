# FAKE DATA!

@key = Bitcoin::Key.from_base58("93SXbJxzDKu4GGoh92DBW8yXbtFUZbPXUL6oqGbdosXD4cGBTbV")

@note = Note.create(
  content: "I love you baby for ever",
  address: @key.addr,
  email: "scottli_010@hotmail.com",
  encrypted_private_key: AES.encrypt(@key.priv, ENV["DECRYPTION_KEY"])
)

@note.note_transactions.create(
  tx_hash: "6f9e9570881e781db8c137c84c111a138e4a022e6b2def5e2a1589a802fe25f3",
  satoshis: 100_000,
  tx_type: "payment",
)

@note.note_transactions.create(
  tx_hash: "6f9e9570881e781db8c137c84c111a138e4a022e6b2def5e2a1589a802fe25f3",
  satoshis: 32_000,
  tx_type: "proof",
)

@note.note_transactions.create(
  tx_hash: "6f9e9570881e781db8c137c84c111a138e4a022e6b2def5e2a1589a802fe25f3",
  satoshis: 10_000,
  tx_type: "withdrawal",
)
