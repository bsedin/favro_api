require_relative './request'
require_relative './data_types'

module FavroApi
  class Driver
    def cards(params = {})
      response = Request.fetch(:cards, params)

      response.parse(type: FavroApi::DataTypes::Card)
    end

    def collections(params = {})
      response = Request.fetch(:collections, params)

      response.parse(type: FavroApi::DataTypes::Collection)
    end

    def comments(params = {})
      response = Request.fetch(:comments, params)

      response.parse(type: FavroApi::DataTypes::Comment)
    end

    def custom_fields(params = {})
      response = Request.fetch(:custom_fields, params)

      response.parse
    end

    def organizations(params = {})
      response = Request.fetch(:organizations, params)

      response.parse(type: FavroApi::DataTypes::Organization)
    end

    def tasks(params = {})
      response = Request.fetch(:tasks, params)

      response.parse(type: FavroApi::DataTypes::Task)
    end

    def tasklists(params = {})
      response = Request.fetch(:tasklists, params)

      response.parse(type: FavroApi::DataTypes::Tasklist)
    end

    def users(params = {})
      response = Request.fetch(:users, params)

      response.parse(type: FavroApi::DataTypes::User)
    end
  end
end
