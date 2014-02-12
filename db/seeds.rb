# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@key = Bitcoin::Key.from_base58("93SXbJxzDKu4GGoh92DBW8yXbtFUZbPXUL6oqGbdosXD4cGBTbV")

@note = Note.create(
  content: "I love you baby for ever",
  address: @key.addr,
  email: "scottli_010@hotmail.com",
  encrypted_private_key: AES.encrypt(@key.priv, ENV["DECRYPTION_KEY"])
)
