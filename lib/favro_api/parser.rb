module FavroApi
  module Parser
    class ParserError < RuntimeError; end

    def new(*args)
      if args.any?
        return parse(*args)
      end
      super
    end

    def parse(data)
      case data
      when Array
        parse_array(data)
      when Hash
        parse_hash(data)
      else
        raise ParserError, "Can't parse #{data.class.name}"
      end
    end

    private

    def parse_hash(hash)
      instance = new
      fields.each do |field|
        value = hash[field[:name].to_s]
        instance.send("#{field[:name]}=", parse_field(field, value))
      end
      instance
    end

    def parse_array(array)
      array.map do |data|
        parse(data)
      end
    end

    def parse_field(field, value = nil)
      if field[:type].is_a?(Array) && array_field = field[:type][0]
        return value.to_a.map {|val| array_field.new(val) }
      end
      field[:type].new(value)
    end
  end
end
