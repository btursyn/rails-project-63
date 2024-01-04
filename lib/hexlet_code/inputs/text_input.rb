# frozen_string_literal: true

module HexletCode
  module Inputs
    # class for text inputs
    class TextInput < BaseInput
      DEFAULT_ATTRIBUTES = { cols: '20', rows: '40' }

      def initialize(input)
        super(input)
        attributes = DEFAULT_ATTRIBUTES.merge(@input[:attributes])
        @input[:attributes] = { name: @input[:name] }.merge(attributes)
      end

      def tag
        Tag.build('textarea', @input[:attributes]) { @input[:value] }
      end
    end
  end
end
