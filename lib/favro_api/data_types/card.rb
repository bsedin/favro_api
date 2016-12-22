require_relative './base'

module FavroApi
  module DataTypes
    class Card < ComplexType

      field :cardId,         String
      field :cardCommonId,   String

      field :organizationId,  String
      field :widgetCommonId,  String
      field :columnId,        String
      field :parentCardId,    String
      field :isLane,          Boolean

      field :name,           String
      field :archived,       Boolean
      field :position,       Float

      field :dueDate,        Time
      field :startDate,      Time

      field :tags,          Array[String]
      field :customFields,  Array[CustomField]
      field :assignments,   Array[Assignment]

      field :detailedDescription, String

      field :tasksTotal, Integer
      field :tasksDone,  Integer
    end
  end
end
