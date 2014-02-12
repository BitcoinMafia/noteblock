module TransactionUtils
  extend self

  def pluck_addresses(transaction)
    pluck_input_addresses + pluck_output_addresses
  end

  def pluck_input_addresses(transaction)
    transaction["in"].map do |input|
      input["prev_out"]["address"]
    end
  end

  def pluck_output_addresses(transaction)
    transaction["out"].map do |output|
      output["address"]
    end
  end

  def output_value_for(transaction, address)
    transaction["out"].each do |output|
      if output["address"] == address
        return output["value"]
      end
    end
  end

  def total_output_value(transaction)
    total_output_value = 0

    transaction["out"].each do |output|
      total_output_value << output["value"]
    end

    return total_output_value
  end

  def estimate_fees(transaction)
    total_input_value = 0
    total_output_value = 0

    transaction["in"].each do |input|
      total_input_value += input["prev_out"]["value"]
    end

    transaction["out"].each do |output|
      total_output_value += output["value"]
    end

    fee = total_input_value - total_output_value
    return fee
  end

  def low_outputs?(transaction, value: 5400)
    transaction["out"].each do |output|
      return true if output["value"] <= value
    end

    return false
  end
end
