require_relative './base'

module FavroApi
  module DataTypes
    class Tasklist < ComplexType

      field :taskListId,      String
      field :cardCommonId,    String
      field :organizationId,  String
      field :name,            String
      field :position,        Integer
    end
  end
end
