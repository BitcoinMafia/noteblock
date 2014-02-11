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
      HTTParty.get("#{URL}/#{address}")
    end

    def unspents(address)
      response = HTTParty.get("#{URL}/#{address}/unspents")
      return response["data"]["unspents"]
    end

    def transactions(address)
      HTTParty.get("#{URL}/#{address}/transactions")
    end

  end

  module Transactions
    extend self
    URL = BASE + "/transactions"

    def single(tx_hash)
      HTTParty.get("#{URL}/#{tx_hash}")
    end

    def batch(tx_hashes_arr)
      response = HTTParty.get("#{URL}", query: {
        tx_hashes: tx_hashes_arr
      })

      response["data"]["transactions"]
    end

    def post(hex)
      HTTParty.post("#{URL}", body: {
        hex: hex
      })
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
