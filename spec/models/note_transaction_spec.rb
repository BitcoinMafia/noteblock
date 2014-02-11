require 'spec_helper'

describe NoteTransaction do
  let(:valid_hash) { "6f9e9570881e781db8c137c84c111a138e4a022e6b2def5e2a1589a802fe25f3" }
  let(:invalid_hash) { "this is obviously not correct" }
  let(:satoshis) { 100_000 }
  let(:tx_type) { "payment" }

  context "Validations" do

    before(:each) do
      @note_transaction = NoteTransaction.new
    end

    it "should not save without tx_hash" do
      @note_transaction.tx_hash = nil
      @note_transaction.satoshis = satoshis
      @note_transaction.tx_type = tx_type
      expect(@note_transaction.save).to eq(false)
    end

    it "should not save with an invalid tx_hash" do
      @note_transaction.tx_hash = invalid_hash
      @note_transaction.satoshis = satoshis
      @note_transaction.tx_type = tx_type
      expect(@note_transaction.save).to eq(false)
    end

    it "should not save without a tx_type" do
      @note_transaction.tx_hash = valid_hash
      @note_transaction.satoshis = satoshis
      @note_transaction.tx_type = nil
      expect(@note_transaction.save).to eq(false)
    end

    it "should not save with a non allowed tx_type" do
      @note_transaction.tx_hash = valid_hash
      @note_transaction.satoshis = satoshis
      @note_transaction.tx_type = "whatever"
      expect(@note_transaction.save).to eq(false)
    end

    it "should otherwise save" do
      @note_transaction.tx_hash = valid_hash
      @note_transaction.satoshis = satoshis
      @note_transaction.tx_type = tx_type
      expect(@note_transaction.save).to eq(true)
    end
  end

  context "Associations" do
    it "should belong to Note"
  end
end
