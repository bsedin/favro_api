module FavroApi
  module DataTypes
    class CustomField
      extend Fields
      extend Parser

      field :customFieldId, String
    end
  end
end
