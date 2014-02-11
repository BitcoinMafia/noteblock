require 'spec_helper'

describe TransactionBuilder do

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
      hex = TransactionBuilder.build(from_address: nil )
    }.to raise_error(RuntimeError, /arguments/)
  end

  it "should reject if no to_addresses"

  it "should return error if from_address invalid"

  it "should return error if to_addresses invalid"

  it "should return error if to_addresses invalid"

  it "should otherwise build a transaction hex" do
    raw_transaction = TransactionBuilder.build(
      from_address: from_address,
      encrypted_private_key: encrypted_private_key,
      to_addresses: @to_addresses
    )

    expect(raw_transaction[:hex].scan(/\H/).blank?).to equal(true)
  end

  it "should propagate transaction and return in the blockchain" do
    raw_transaction = TransactionBuilder.build(
      from_address: from_address,
      encrypted_private_key: encrypted_private_key,
      to_addresses: @to_addresses
    )

    res = BitcoinNodeAPI::Transactions.propagate(raw_transaction[:hex])

    sleep 2

    check = BitcoinNodeAPI::Transactions.single(raw_transaction[:tx_hash])

    expect(res["tx_hash"]).to equal(raw_transaction[:tx_hash])
    expect(check["tx_hash"]).to equal(raw_transaction[:tx_hash])
  end

end