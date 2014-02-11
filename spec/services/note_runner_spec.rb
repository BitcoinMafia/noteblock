require 'spec_helper'
require './spec/fixtures.rb'

describe NoteRunner do

  before(:all) do

    @key = Bitcoin::Key.from_base58("cPL4Lx1R19kdeW3DVkFDwbVMTc7A3HgeoLAjS3RAo9ZzKqtSVC6N")
    @address = @key.addr

    @addresses_array = [@address]
    @note = Note.create(
      content: "I love you baby for ever",
      address: @address,
      email: "scottli_010@hotmail.com",
      encrypted_private_key: AES.encrypt(@key.priv, ENV["DECRYPTION_KEY"])
      )

    10.times do
      key = Bitcoin.generate_key

      Note.create(
        content: SecureRandom.hex(30),
        address: Bitcoin.pubkey_to_address(key[1]),
        encrypted_private_key: AES.encrypt(key[0], ENV["DECRYPTION_KEY"])
        )
    end

    @notes = Note.pluck(:address)
    @transaction = FIXTURES::TRANSACTION

    end

    it "should check presence" do
      expect(NoteRunner::Task.address_present?(["random"], @notes)).to eq(false)
      expect(NoteRunner::Task.address_present?(@addresses_array, @notes)).to eq(true)
    end

    it "should create payment" do
      expect(NoteRunner::Task.save_payment(@note, @transaction)).to eq(true)

      payment = NoteTransaction.where(tx_hash: @transaction["tx_hash"])[0]
      expect(payment.satoshis).to eq(@transaction["out"][0]["value"])
    end

    it "should not create payment if payment invalid" do
      [
        FIXTURES::TRANSACTION_NO_FEES,
        FIXTURES::TRANSACTION_BELOW_MIN,
        FIXTURES::TRANSACTION_LOW_OUTPUTS
      ].each do |transaction|
        expect(NoteRunner::Task.check_payment_validity(@note, transaction)).to eq(false)
      end
    end

    it "should check payment validity" do
      expect(NoteRunner::Task.check_payment_validity(@note, @transaction)).to eq(true)
    end

    it "should create note proof" do
      expect(NoteRunner::Task.create_proof(@note)).to eq(true)
    end

    it "should create token" do
      expect(NoteRunner::Task.create_token(@note)).to eq(true)
    end

    it "should send email" do
      @note.encrypted_token = "random_token"
      @note.save
      expect(NoteRunner::Task.send_email(@note)).to eq(true)
    end

    # TODO: need better spec
    it "should not send if no email" do
      @note.encrypted_token = "random_token"
      @note.email = nil
      @note.save
      expect(NoteRunner::Task.send_email(@note)).to eq(true)
    end

  end
