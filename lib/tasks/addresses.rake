# TODO INCLUDE THESE GEMS
require 'eventmachine'
require 'faye/websocket'

namespace :addresses do
  desc "Listens for incoming transactions for notes' addresses"
  task poll: :environment do
    addresses = Note.pluck(:addresses)


    # e.g. 1000 addresses
  end

  task socket: :environment do
    EM.run {
      ws = Faye::WebSocket::Client.new('ws://mainnet-helloblock-socket.herokuapp.com')

      ws.on :open do |event|
        p [:open]
        ws.send('Hello, world!')
      end

      ws.on :message do |event|
        p [:message, event.data]

        # Check whether add
        addresses = Note.pluck(:addresses)
        if addresses.include?(event.data)
          # Mark payment
          payment = NotePayment.create()
          # Create hex
          # Propagate hex
          # Proof
          # Stream to client
        end
      end

      ws.on :close do |event|
        p [:close, event.code, event.reason]
        ws = nil

      end
    }

  end

end
