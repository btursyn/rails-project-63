# frozen_string_literal: true

module HexletCode
  module Inputs
    # class for string inputs
    class StringInput < BaseInput
      DEFAULT_ATTRIBUTES = { type: 'text' }

      def initialize(input)
        super(input)
        attributes = DEFAULT_ATTRIBUTES.merge(@input[:attributes])
        @input[:attributes] = { name: @input[:name] }.merge(attributes)
      end

      def tag
        Tag.build('input', @input[:attributes].merge({ value: @input[:value] }))
      end
    end
  end
end
