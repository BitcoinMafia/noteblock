module HelloBlock
  module Client
    extend self

    BASE = "https://#{ENV["BLOCKCHAIN_MODE"]}.helloblock.io/v1"

    def get(resource, query: {})
      response = HTTParty.get("#{BASE}#{resource}", query: query)
      Errors.code(response.code, response.body)
      response['data']
    end

    def post(resource, body: {})
      response = HTTParty.post("#{BASE}#{resource}", body: body)
      Errors.code(response.code, response.body)
      response['data']
    end
  end

  module Errors
    extend self

    def code(code, body)
      if code == 500
        p body
        raise "ServerError"
      end
      if code == 404
        p body
        raise "NotFound"
      end
      if code == 400
        p body
        raise "BadRequest"
      end
    end

  end
end
