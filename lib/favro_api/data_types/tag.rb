require_relative './base'

module FavroApi
  module DataTypes
    class Tag < ComplexType

      field :tagId,           String
      field :organizationId,  String
      field :name,            String
      field :color,           String
    end
  end
end
