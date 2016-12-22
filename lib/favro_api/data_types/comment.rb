require_relative './base'

module FavroApi
  module DataTypes
    class Comment < ComplexType
      field :commentId,       String
      field :organizationId,  String
      field :cardCommonId,    String
      field :comment,         String
      field :userId,          String
      field :created,         Time
      field :lastUpdated,     Time
    end
  end
end
