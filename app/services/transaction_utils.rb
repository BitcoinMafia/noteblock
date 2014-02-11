module TransactionUtils
  extend self

  def pluck_addresses(transaction, inputs: false)
    addresses = []

    if inputs
      transaction["in"].each do |input|
        addresses << input["prev_out"]["address"]
      end
    end

    transaction["out"].each do |output|
      addresses << output["address"]
    end

    return addresses
  end

  def output_value_for(transaction, address)
    transaction["out"].each do |output|
      if output["address"] == address
        return output["value"]
      end
    end
  end
end
