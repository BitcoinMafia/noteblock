case ENV["BLOCKCHAIN_MODE"]
when "testnet"
  Bitcoin.network = :testnet3
when "mainnet"
  Bitcoin.network = :bitcoin
else
  Bitcoin.network = :testnet3
end
