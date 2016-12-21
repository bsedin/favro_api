module FavroApi
  module DataTypes
    class Collection
      extend Fields
      extend Parser

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
