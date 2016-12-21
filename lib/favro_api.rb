require 'faraday'

require_relative './favro_api/version'

require_relative './favro_api/parser'
require_relative './favro_api/fields'
require_relative './favro_api/data_types'
require_relative './favro_api/driver'
require_relative './favro_api/response'

module FavroApi
  class ApiError < StandardError; end

  class << self
    attr_accessor :auth_email, :auth_token, :organization_id

    def auth(params = {})
      self.auth_email = params[:email]
      self.auth_token = params[:token]
      params
    end

    def driver
      Driver.new
    end

    def method_missing(meth, *args)
      if driver.respond_to? meth
        return driver.public_send meth, *args
      end
      super
    end
  end
end
