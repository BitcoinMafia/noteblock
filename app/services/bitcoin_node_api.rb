# TODO: Local SSL Bug
OpenSSL::SSL::VERIFY_PEER = 0 #OpenSSL::SSL::VERIFY_NONE

# Need HelloBlock module to handle responses?
module BitcoinNodeAPI
  extend self

  BASE = "https://#{ENV["BLOCKCHAIN_MODE"]}.helloblock.io/v1"

  module Addresses
    extend self
    URL = BASE + "/addresses"

    def single(address)
      response = HelloBlock::Client.get("/addresses/#{address}")
      return response["address"]
    end

    def unspents(address)
      response = HelloBlock::Client.get("/addresses/#{address}/unspents")
      return response["unspents"]
    end

    def transactions(address)
      response = HelloBlock::Client.get("/addresses/#{address}/transactions")
      return response["transactions"]
    end

  end

  module Transactions
    extend self

    def single(tx_hash)
      response = HelloBlock::Client.get("/transactions/#{tx_hash}")
      return response["transaction"]
    end

    def batch(tx_hashes_arr)
      response = HelloBlock::Client.get("/transactions", query: {
        tx_hashes: tx_hashes_arr
      })

      return response["transactions"]
    end

    def propagate(hex)
      response = HelloBlock::Client.post("/transactions", body: {
        hex: hex
      })

      return response
    end

  end

  module Blocks
    extend self
    URL = BASE + "/blocks"

    def single(id)
      HTTParty.get("#{URL}/#{id}")
    end

  end

  module Wallet
    extend self
    URL = BASE + "/wallet"

    def fetch

    end

  end

end
