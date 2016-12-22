require 'time'

require_relative '../fields'
require_relative '../parser'

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

    class ComplexType
      extend Parser
      extend Fields
    end
  end
end

