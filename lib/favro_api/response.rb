module FavroApi
  class Response
    extend Forwardable

    attr_accessor :response, :entities, :page, :limit, :pages, :request_id

    def_delegators :response, :status, :body

    def initialize(opts = {})
      self.response = opts.delete(:response)
    end

    def error?
      status >= 400
    end

    def parse(type: nil)
      self.entities =
        if type
          type.send(:parse, parsed_response['entities'])
        else
          parsed_response['entities']
        end
      self.pages      = parsed_response['pages']
      self.page       = parsed_response['page']
      self.limit      = parsed_response['limit']
      self.request_id = parsed_response['requestId']
      self
    end

    def parsed_response
      @parsed_response ||= JSON.parse(body)
    end

    def backend_identifier
      response.headers['x-favro-backend-identifier']
    end

    def ratelimit
      {
        limit:     response.headers['x-ratelimit-limit'].to_i,
        remaining: response.headers['x-ratelimit-remaining'].to_i,
        reset:     Time.parse(response.headers['x-ratelimit-reset'])
      }
    end
  end
end
