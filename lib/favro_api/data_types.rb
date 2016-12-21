require 'time'

module FavroApi
  module DataTypes
    class Array < ::Array
      def self.new(value = [])
        value ? super(value) : value
      end
    end

    class Hash < ::Hash
      def self.new(value)
        value.to_h
      end
    end

    class String < ::String
      def self.new(value = '')
        value.to_s
      end
    end

    class Boolean
      def self.new(value)
        'true' == value.to_s
      end
    end

    class Date < ::Date
      def self.new(value)
        return nil if value.nil?
        value.is_a?(::Date) ? value : Date.parse(value.to_s)
      end
    end

    class Time < ::Time
      def self.new(value)
        return nil if value.nil?
        value.is_a?(::Time) ? value : Time.parse(value.to_s)
      end
    end

    class Integer < ::Integer
      def self.new(value)
        value.to_i
      end
    end

    class Float < ::Float
      def self.new(value)
        value.to_f
      end
    end
  end
end

require_relative './data_types/shared_to_user'
require_relative './data_types/custom_field'
require_relative './data_types/assignment'
require_relative './data_types/card'
require_relative './data_types/column'
require_relative './data_types/tag'
require_relative './data_types/widget'
require_relative './data_types/organization'
require_relative './data_types/user'
