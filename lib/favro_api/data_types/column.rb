module FavroApi
  module DataTypes
    class Column
      extend Fields
      extend Parser

      field :columnId,        String
      field :organizationId,  String
      field :widgetCommonId,  String
      field :name,            String
      field :position,        Integer
    end
  end
end
