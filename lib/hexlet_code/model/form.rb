# frozen_string_literal: true

module HexletCode
  module Model
    # dto class for Form
    class Form
      attr_accessor :attributes, :inner_tags

      def initialize(attributes, inner_tags)
        @attributes = attributes
        @inner_tags = inner_tags
      end
    end
  end
end
