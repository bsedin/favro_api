require 'time'
require 'faraday'

require_relative './favro_api/version'
require_relative './favro_api/auth'
require_relative './favro_api/driver'

module FavroApi
  class ApiError < StandardError; end

  class << self
    attr_accessor :auth, :organization_id

    def auth=(params = {})
      @auth = Auth.new(params[:email], params[:token])
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
