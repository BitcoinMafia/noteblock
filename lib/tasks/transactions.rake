# TODO INCLUDE THESE GEMS
require 'SocketIO'

namespace :transactions do
  desc "Listens for incoming transactions for notes' addresses"
  task poll: :environment do
    addresses = Note.pluck(:addresses)


    # e.g. 1000 addresses
  end

  task socket: :environment do
    HelloBlock::Socket.recursive_connect()
  end

end


