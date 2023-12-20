# frozen_string_literal: true

module HexletCode
  module Model
    # dto class for Tag
    class Tag
      attr_accessor :type, :attributes, :value, :contented

      def initialize(type, attributes, value, contented: false)
        @type = type
        @attributes = attributes
        @value = value
        @contented = contented
      end
    end
  end
end
