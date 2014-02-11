# TODO INCLUDE THESE GEMS
require 'SocketIO'

namespace :addresses do
  desc "Listens for incoming transactions for notes' addresses"
  task poll: :environment do
    addresses = Note.pluck(:addresses)


    # e.g. 1000 addresses
  end

  task socket: :environment do
    client = SocketIO.connect("https://mainnet-helloblock-socket.herokuapp.com:443") do
      p 'CONNECTING ...'

      on_connect do |data|
        p "CONNECTED!"
      end

      on_event("latest") do |data|
        transaction =  data[0]["message"]
        NoteRunner.execute(transaction)
      end

    end
  end

end
