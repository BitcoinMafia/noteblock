# TODO INCLUDE THESE GEMS
require 'SocketIO'

namespace :transactions do
  desc "Listens for incoming transactions for notes' addresses"

  task poll: :environment do
    addresses = Note.pending.pluck(:address)
    addresses.each do |address|
      ap "Checking #{address}"
      transactions = BitcoinNodeAPI::Addresses.transactions(address)
      transactions.each do |tx|
        NoteRunner.execute(tx)
      end
    end

    # e.g. 1000 addresses
  end

  task socket: :environment do
    HelloBlock::Socket.recursive_connect()
  end

end


