require 'spec_helper'

describe AES do
  it "encrypts and decrypts private key" do
    100.times do
      encryption_key = Random.new.bytes(50).to_s
      private_key, public_key = Bitcoin::generate_key
      encrypted_private_key = AES.encrypt(private_key, encryption_key)
      data = AES.decrypt(encrypted_private_key, encryption_key)
      expect(data).to eq(private_key)
    end
  end
end
