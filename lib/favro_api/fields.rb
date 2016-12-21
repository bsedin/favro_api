module FavroApi
  module Fields
    def field(name, type)
      fields << { name: name, type: type }
      attr_accessor name
    end

    def fields
      @fields ||= []
    end
  end
end
