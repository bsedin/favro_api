require_relative './base'

module FavroApi
  module DataTypes
    class Task < ComplexType

      field :taskId,          String
      field :taskListId,      String
      field :cardCommonId,    String
      field :organizationId,  String
      field :name,            String
      field :completed,       Boolean
      field :position,        Integer
    end
  end
end
