require 'spec_helper'

describe Note do
  let(:content) { "I love you forever babe" }
  let(:address) { "n1hvXVVmnjmHWBBVDR8p3TAkcvG8vhRR3r" }
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
      @note.from = nil
      expect(@note.save).to eq(true)
    end

    it "should otherwise save" do
      @note.content = content
      @note.address = address
      @note.encrypted_private_key = encrypted_private_key
      @note.from = 'ScottyLi'
      expect(@note.save).to eq(true)
    end

  end

  context "Assocations" do
    it "should have one note payment"

    it "should have one note proof"
  end
end
