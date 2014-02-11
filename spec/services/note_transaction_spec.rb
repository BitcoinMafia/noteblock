require 'spec_helper'

describe NoteTransaction do

  let(:note) { "I love you baby 4eva and eva" }
  let(:private_key) {"cPL4Lx1R19kdeW3DVkFDwbVMTc7A3HgeoLAjS3RAo9ZzKqtSVC6N"}
  let(:encrypted_private_key) { AES.encrypt(private_key, ENV["DECRYPTION_KEY"])}
  let(:from_address) { "mvaRDyLUeF4CP7Lu9umbU3FxehyC5nUz3L" }

  before(:each) do
    # TODO: use faucet
    # BitcoinNodeAPI::Faucet.unspents
    hash160s = NoteConvertor.utf8_to_hex(note)
    @to_addresses = hash160s.map {|h| Bitcoin.hash160_to_address(h)}
  end

  it "should reject if no from_address" do
    expect {
      hex = NoteTransaction.build(from_address: nil )
    }.to raise_error(RuntimeError, /address/)
  end

  it "should reject if no to_addresses"

  it "should return error if from_address invalid"

  it "should return error if to_addresses invalid"

  it "should return error if to_addresses invalid"

  it "should otherwise build a transaction hex" do
    raw_transaction = NoteTransaction.build(
      from_address: from_address,
      encrypted_private_key: encrypted_private_key,
      to_addresses: @to_addresses
    )

    expect(raw_transaction[:hex].scan(/\H/).blank?).to equal(true)
  end

end
