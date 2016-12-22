require_relative './base'

module FavroApi
  module DataTypes
    class Assignment < ComplexType

      field :userId,    String
      field :completed, Boolean
    end
  end
end
