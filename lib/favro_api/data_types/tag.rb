module FavroApi
  module DataTypes
    class Tag
      extend Fields
      extend Parser

      field :tagId,           String
      field :organizationId,  String
      field :name,            String
      field :color,           String
    end
  end
end
