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
      users:          '/users',
      widgets:        '/widgets'
    }.freeze

    attr_accessor :connection, :url, :endpoint, :params, :method,
      :last_response, :page

    def initialize(options = {})
      self.url           = options[:url]
      self.endpoint      = options[:endpoint]
      self.method        = options[:method] || :get
      self.params        = options[:params] || {}
      self.last_response = options[:last_response]
      self.page          = options[:page]
    end

    def fetch
      self.connection = Faraday.new("#{uri.scheme}://#{uri.hostname}") do |faraday|
        faraday.adapter :net_http
        faraday.basic_auth(FavroApi.auth.email, FavroApi.auth.token)
        faraday.headers['organizationId'] = params.delete(:organization_id)
        faraday.params['page']      = page || (last_response ? last_response.page + 1 : 0)
        faraday.params['requestId'] = last_response&.request_id
      end

      response = Response.new(response: connection.send(method, uri.request_uri, params))

      if response.error?
        raise ApiError, "Got API error. Code: #{response.status}, message: #{response.body}"
      end

      response
    end

    class << self
      def fetch(endpoint, page: nil, last_response: nil, params: {})
        new(
          endpoint:      endpoint,
          last_response: last_response,
          page:          page,
          method:        :get,
          params:        params
        ).fetch
      end
    end

    def url
      @url ||= api_url_for(endpoint)
    end

    private

    def api_url_for(endpoint)
      path = ENDPOINTS[endpoint] || raise(ApiError, "Unknown endpoint #{endpoint}")
      "#{API_URL}#{path}"
    end

    def uri
      URI(url)
    end
  end
end
