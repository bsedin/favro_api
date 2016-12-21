module FavroApi
  class Driver

    API_URL = 'https://favro.com/api/v1'.freeze

    ENDPOINTS = {
      cards: '/cards',
      users: '/users'
    }.freeze

    attr_accessor :email, :api_token, :options

    def initialize(opts = {})
      self.api_token = opts.delete(:api_token)
    end

    def users(params = {})
      request api_url_for(:users), :get, params
    end

    def cards(params = {})
      response = request(api_url_for(:cards), :get, params)
      if response.error?
        raise ApiError, "Got API error. Code: #{response.status}, message: #{response.body}"
      end

      parsed_response = response.parsed_response
      FavroApi::DataTypes::Card.parse(parsed_response['entities'])
    end

    private

    def auth
      [ FavroApi.auth_email, FavroApi.auth_token ]
    end

    def api_url_for(endpoint)
      path = ENDPOINTS[endpoint] || raise(ApiError, "Unknown endpoint #{endpoint}")
      "#{API_URL}#{path}"
    end

    def request(url, method = :get, params = {})
      uri = URI(url)

      conn = Faraday.new("#{uri.scheme}://#{uri.hostname}") do |faraday|
        faraday.adapter :net_http
        faraday.headers['organizationId'] = params.delete(:organization_id)
        faraday.basic_auth(*auth)
      end

      Response.new(response: conn.send(method, uri.request_uri, params))
    end
  end
end
