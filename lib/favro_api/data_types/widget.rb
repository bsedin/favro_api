module FavroApi
  module DataTypes
    class Widget
      extend Fields
      extend Parser

      field :widgetCommonId,         String
      field :organizationId,         String
      field :collectionIds,          Array[String]
      field :name,                   String
      field :type,                   String
      field :breakdownCardCommonId,  String
      field :publicSharing,          String
      field :color,                  String
      field :sharedToUsers,          Array[SharedToUser]
    end
  end
end
