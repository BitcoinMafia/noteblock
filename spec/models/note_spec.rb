require 'spec_helper'

describe Note do
  let(:content) { "I love you forever babe" }
  let(:address) { "n1hvXVVmnjmHWBBVDR8p3TAkcvG8vhRR3r" }
  let(:email) { "scott@example.com" }
  let(:private_key) { "7ad9df131580c3b5fabd947f9b7cc861fd0ea2625fb7aac7259b42fa7ed78215" }
  let(:encrypted_private_key) { "+bFR1JxIAphskjK6r26VJgCF46p2vjR2kBaX4SXnJHLs+yI0ezDqpw7YOrqwKi8ljq9i1eNU8Xz2Ya7/YPYuWZZYz4ZFYFL1RZ60xYHpbF+QC9a3fbQg5AQfXKt9l059" }

  context "Validations" do
    before(:each) do
      @note = Note.new
    end

    it "should not save if content >76 characters" do
      @note.content = "test content obviously too long, test content obviously too long"\
      "test content obviously too long, test content obviously too long"
      @note.address = address
      @note.encrypted_private_key = encrypted_private_key
      expect(@note.save).to eq(false)
    end

    it "should not save if address is blank" do
      @note.content = content
      @note.address = nil
      @note.encrypted_private_key = encrypted_private_key
      expect(@note.save).to eq(false)
    end

    it "should not save if encrypted_priv_key is blank" do
      @note.content = content
      @note.address = address
      @note.encrypted_private_key = nil
      expect(@note.save).to eq(false)
    end

    it "should not save raw private key" do
      @note.content = content
      @note.address = address
      @note.encrypted_private_key = private_key
      expect(@note.save).to eq(false)
    end

    it "should save if from does not exist" do
      @note.content = content
      @note.address = address
      @note.encrypted_private_key = encrypted_private_key
      @note.sender = nil
      expect(@note.save).to eq(true)
    end

    it "should save if email is invalid" do
      @note.content = content
      @note.address = address
      @note.email = "aslkdjfaklsdjlkajdsfkla"
      @note.encrypted_private_key = encrypted_private_key
      @note.sender = 'ScottyLi'
      expect(@note.save).to eq(false)
    end

    it "should otherwise save" do
      @note.content = content
      @note.address = address
      @note.encrypted_private_key = encrypted_private_key
      @note.sender = 'ScottyLi'
      expect(@note.save).to eq(true)
    end

    it "should have allow flagging" do
      @note.content = content
      @note.address = address
      @note.address = email
      @note.encrypted_private_key = encrypted_private_key
      @note.sender = 'ScottyLi'
      @note.save
      expect(@note.flagged).to eq(false)
      @note.flagged = true
      @note.save
      expect(@note.flagged).to eq(true)
    end

  end

  context "Token" do
    before(:each) do
      @note = Note.new
      @note.content = content
      @note.address = address
      @note.encrypted_private_key = encrypted_private_key
      @note.sender = 'ScottyLi'
      @note.save
    end

    it "should allow token creation" do
      token = Note.generate_token
      expect(!token[/\H/]).to eq(true) # ensure it's a hex
      expect(token.length).to eq(128)
    end

    # it "should not save unencrypted token" do
    #   @note.encrypted_token = Note.generate_token
    #   expect(@note.save).to eq(false)
    # end

    it "should otherwise save" do
      # encrypted_token = AES.encrypt(Note.generate_token, ENV["DECRYPTION_KEY"])

      @note.encrypted_token = Note.generate_token
      expect(@note.save).to eq(true)
    end

    # it "should allow queries on token" do
    #   original_token = Note.generate_token
    #   encrypted_token = AES.encrypt(original_token, ENV["DECRYPTION_KEY"])
    #   @note.encrypted_token = encrypted_token
    #   @note.save

    #   note = Note.where(encrypted_token: encrypted_token)[0]
    #   unencrypted_token =  AES.decrypt(note.encrypted_token, ENV["DECRYPTION_KEY"])
    #   expect(unencrypted_token).to eq(original_token)
    # end
  end

  context "Assocations" do
    it "should have many NoteTransactions" do
      note = Note.reflect_on_association(:note_transactions)
      expect(note.macro).to eq(:has_many)
    end

  end

  context "Creation" do
    it "should run initial_create" do
      params = {
        email: "scottli_010@hotmail.com",
        content: "Love you baby",
        sender: "Jennifer Lawrence"
      }

      note = Note.initial_build(params)
      expect(note.save).to eq(true)

      private_key = AES.decrypt(note.encrypted_private_key, ENV["DECRYPTION_KEY"])
      expect(private_key).to be_true
    end
  end

  context "Claim" do
    before(:each) do
      @note = Note.new
      @note.content = content
      @note.sender = 'ScottyLi'

      private_key = "cPL4Lx1R19kdeW3DVkFDwbVMTc7A3HgeoLAjS3RAo9ZzKqtSVC6N"
      key = Bitcoin::Key.from_base58(private_key)

      @note.address = key.addr
      @note.encrypted_private_key = AES.encrypt(key.priv, ENV["DECRYPTION_KEY"])

      @encrypted_token = Note.generate_token
      @note.encrypted_token = @encrypted_token
      @note.save
    end

    it "should allow claiming" do
      claim = Note.claim(
        encrypted_token: @encrypted_token,
        to_address: "mzPkw5EdvHCntC2hrhRXSqwHLHpLWzSZiL",
        amount: 20_000,
        compressed: true)

      expect(claim).to eq(true)
    end
  end
end
