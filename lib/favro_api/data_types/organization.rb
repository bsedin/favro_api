module FavroApi
  module DataTypes
    class Organization
      extend Fields
      extend Parser

      field :organizationId,  String
      field :name,            String
      field :sharedToUsers,   Array[SharedToUser]
    end
  end
end
