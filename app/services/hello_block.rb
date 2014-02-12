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
      # TODO: PagerDuty
      begin
        response = HTTParty.post("#{BASE}#{resource}", body: body)
        Errors.code(response.code, response.body)
        response['data']
      rescue => e
        PagerDutyMgr::CriticalBug.trigger("Post failed", {
          inspect: e.inspect,
          backtrace: e.backtrace
        })
        ap "HelloBlock::Client.post failed"
        ap e.inspect
        ap e.backtrace
      end
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

  module Socket
    extend self

    BASE = "https://#{ENV["BLOCKCHAIN_MODE"]}-helloblock-socket.herokuapp.com:443"

    def recursive_connect()
      last = nil
      client = SocketIO.connect(BASE) do
        p 'connecting ...'

        on_connect do |data|
          p "CONNECTED"
        end

        on_event("latest") do |data|
          begin
            # Hack, as rake task is producing double
            next if last == data
            last = data

            transaction = data[0]["message"]
            ap transaction["tx_hash"]
            NoteRunner.execute(transaction)
          rescue => e
            PagerDutyMgr::CriticalBug.trigger("Error in NoteRunner", {
              inspect: e.inspect,
              backtrace: e.backtrace
            })
            ap "Runner Failed"
            ap e.inspect
            ap e.backtrace
          end
        end
      end

      # Shouldn't go there, means it's disconnected
      PagerDutyMgr::CriticalBug.trigger("Socked Disconnected", {
        inspect: e.inspect,
        backtrace: e.backtrace
      })
      p "DISCONNECTED!"
      p "reconnecting ..."
      self.recursive_connect()
    end

  end
end
