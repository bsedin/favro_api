module FavroApi
  module DataTypes
    class CustomField
      extend Fields
      extend Parser

      field :customFieldId, String
      field :total, Integer
      field :reports, Hash
    end
  end
end
