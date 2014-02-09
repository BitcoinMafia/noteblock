# Need HelloBlock module to handle responses?
module BitcoinNodeAPI
  extend self

  BASE = "https://#{ENV["BLOCKCHAIN_MODE"]}.helloblock.io/v1"

  module Addresses
    extend self
    URL = BASE + "/addresses"

    def single(address)
      RestClient.get("#{URL}/#{address}")
    end

    def unspents
      RestClient.get("#{URL}/#{address}/unspents")
    end

    def transactions
      RestClient.get("#{URL}/#{address}/transactions")
    end

  end

  module Transactions
    extend self
    URL = BASE + "/transactions"

    def single(tx_hash)
      RestClient.get("#{URL}/#{tx_hash}")
    end

    def batch(tx_hashes_arr)
      RestClient.get("#{URL}", query: {
        tx_hashes: tx_hashes_arr
      })
    end

    def post(hex)
      RestClient.post("#{URL}", body: {
        hex: hex
      })
    end

  end

  module Blocks
    extend self
    URL = BASE + "/blocks"

    def single(id)
      RestClient.get("#{URL}/#{id}")
    end

  end

  module Wallet
    extend self
    URL = BASE + "/wallet"

    def fetch

    end

  end

end
