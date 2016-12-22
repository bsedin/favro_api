require_relative './response'

module FavroApi
  class Request

    API_URL = 'https://favro.com/api/v1'.freeze

    ENDPOINTS = {
      cards:          '/cards',
      collections:    '/collections',
      comments:       '/comments',
      custom_fields:  '/customFields',
      organizations:  '/organizations',
      tasks:          '/tasks',
      tasklists:      '/tasklists',
      users:          '/users'
    }.freeze

    attr_accessor :connection, :url, :params, :method

    def initialize(options = {})
      self.url    = options[:url]
      self.method = options[:method]
      self.params = options[:params]

      self.connection = Faraday.new("#{uri.scheme}://#{uri.hostname}") do |faraday|
        faraday.adapter :net_http
        faraday.headers['organizationId'] = params.delete(:organization_id)
        faraday.basic_auth(FavroApi.auth.email, FavroApi.auth.token)
      end
    end

    def fetch
      response = Response.new(response: connection.send(method, uri.request_uri, params))

      if response.error?
        raise ApiError, "Got API error. Code: #{response.status}, message: #{response.body}"
      end

      response
    end

    class << self
      def fetch(endpoint, params = {})
        new(url: api_url_for(endpoint), method: :get, params: params).fetch
      end

      private

      def api_url_for(endpoint)
        path = ENDPOINTS[endpoint] || raise(ApiError, "Unknown endpoint #{endpoint}")
        "#{API_URL}#{path}"
      end
    end

    private

    def uri
      URI(url)
    end
  end
end
