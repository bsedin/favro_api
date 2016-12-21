module FavroApi
  module DataTypes
    class User
      extend Fields
      extend Parser

      field :userId,            String
      field :name,              String
      field :email,             String
      field :organizationRole,  String
    end
  end
end
