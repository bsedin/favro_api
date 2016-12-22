require_relative './base'

module FavroApi
  module DataTypes
    class User < ComplexType

      field :userId,            String
      field :name,              String
      field :email,             String
      field :organizationRole,  String
    end
  end
end
