module FavroApi
  class Driver

    API_URL = 'https://favro.com/api/v1'.freeze

    ENDPOINTS = {
      cards:         '/cards',
      users:         '/users',
      custom_fields: '/customFields',
      collections:   '/collections',
      comments:      '/comments',
      organizations: '/organizations'
    }.freeze

    attr_accessor :email, :api_token, :options

    def initialize(opts = {})
      self.api_token = opts.delete(:api_token)
    end

    def collections(params = {})
      response = request(api_url_for(:users), :get, params)

      parsed_response = response.parsed_response
      parsed_response['entities'] = FavroApi::DataTypes::Collection.parse(parsed_response['entities'])
      parsed_response
    end

    def organizations(params = {})
      response = request(api_url_for(:organizations), :get, params)

      parsed_response = response.parsed_response
      parsed_response['entities'] = FavroApi::DataTypes::Organization.parse(parsed_response['entities'])
      parsed_response
    end

    def users(params = {})
      response = request(api_url_for(:users), :get, params)

      parsed_response = response.parsed_response
      parsed_response['entities'] = FavroApi::DataTypes::User.parse(parsed_response['entities'])
      parsed_response
    end

    def cards(params = {})
      response = request(api_url_for(:cards), :get, params)

      parsed_response = response.parsed_response
      parsed_response['entities'] = FavroApi::DataTypes::Card.parse(parsed_response['entities'])
      parsed_response
    end

    def custom_fields(params = {})
      response = request(api_url_for(:custom_fields), :get, params)

      response.parsed_response
    end

    def comments(params = {})
      response = request(api_url_for(:comments), :get, params)

      parsed_response = response.parsed_response
      parsed_response['entities'] = FavroApi::DataTypes::Comment.parse(parsed_response['entities'])
      parsed_response
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

      response = Response.new(response: conn.send(method, uri.request_uri, params))

      if response.error?
        raise ApiError, "Got API error. Code: #{response.status}, message: #{response.body}"
      end

      response
    end
  end
end
