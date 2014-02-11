# TODO INCLUDE THESE GEMS
require 'SocketIO'

namespace :addresses do
  desc "Listens for incoming transactions for notes' addresses"
  task poll: :environment do
    addresses = Note.pluck(:addresses)


    # e.g. 1000 addresses
  end

  task socket: :environment do
    recursive_socket()
  end

end


def recursive_socket
  client = SocketIO.connect("https://mainnet-helloblock-socket.herokuapp.com:443", {
    reconnect: true
  }) do
    p 'connecting ...'

    on_connect do |data|
      ap "CONNECTED"
    end

    on_event("latest") do |data|
      transaction =  data[0]["message"]
      NoteRunner.execute(transaction)
    end
  end

  # Shouldn't go there, means it's disconnected
  # TODO: Pager duty!
  ap "DISCONNECTED!"
  ap "reconnecting ..."
  recursive_socket()
end
