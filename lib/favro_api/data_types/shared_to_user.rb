module FavroApi
  module DataTypes
    class SharedToUser
      extend Fields
      extend Parser

      field :userId,    String
      field :role,      String
      field :joinDate,  Time
    end
  end
end
