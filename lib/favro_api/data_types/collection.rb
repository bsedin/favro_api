require_relative './base'

module FavroApi
  module DataTypes
    class Collection < ComplexType
      field :collectionId,           String
      field :organizationId,         String
      field :name,                   String
      field :sharedToUsers,          Array[SharedToUser]
      field :publicSharing,          String
      field :background,             String
      field :archived,               Boolean
      field :shareWidgetsByDefault,  Boolean
    end
  end
end
