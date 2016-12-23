require_relative './request'
require_relative './data_types'

module FavroApi
  class Driver
    def cards(params = {})
      response = paginated_request(:cards, params).fetch

      response.parse(type: FavroApi::DataTypes::Card)
    end

    def collections(params = {})
      response = paginated_request(:collections, params).fetch

      response.parse(type: FavroApi::DataTypes::Collection)
    end

    def comments(params = {})
      response = paginated_request(:comments, params).fetch

      response.parse(type: FavroApi::DataTypes::Comment)
    end

    def custom_fields(params = {})
      response = paginated_request(:custom_fields, params).fetch

      response.parse
    end

    def organizations(params = {})
      response = paginated_request(:organizations, params).fetch

      response.parse(type: FavroApi::DataTypes::Organization)
    end

    def tasks(params = {})
      response = paginated_request(:tasks, params).fetch

      response.parse(type: FavroApi::DataTypes::Task)
    end

    def tasklists(params = {})
      response = paginated_request(:tasklists, params).fetch

      response.parse(type: FavroApi::DataTypes::Tasklist)
    end

    def users(params = {})
      response = paginated_request(:users, params).fetch

      response.parse(type: FavroApi::DataTypes::User)
    end

    private

    def paginated_request(endpoint, params)
      Request.new(
        endpoint: endpoint,
        page: params.delete(:page),
        last_response: params.delete(:last_response),
        params: params
      )
    end
  end
end
