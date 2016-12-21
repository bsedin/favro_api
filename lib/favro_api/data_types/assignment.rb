module FavroApi
  module DataTypes
    class Assignment
      extend Fields
      extend Parser

      field :userId,    String
      field :completed, Boolean
    end
  end
end
