require_relative './base'

module FavroApi
  module DataTypes
    class CustomField < ComplexType

      field :customFieldId, String
      field :total, Integer
      field :reports, Hash
    end
  end
end
