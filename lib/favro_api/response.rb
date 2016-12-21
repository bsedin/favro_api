module FavroApi
  class Response
    extend Forwardable

    attr_accessor :response, :data

    def_delegators :response, :status, :body

    def initialize(opts = {})
      self.response = opts.delete(:response)
    end

    def parsed_response
      JSON.parse(body)
    end

    def error?
      status != 200
    end
  end
end
