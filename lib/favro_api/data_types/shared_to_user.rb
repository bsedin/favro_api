require_relative './base'

module FavroApi
  module DataTypes
    class SharedToUser < ComplexType

      field :userId,    String
      field :role,      String
      field :joinDate,  Time
    end
  end
end
