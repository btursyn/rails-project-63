# frozen_string_literal: true

module HexletCode
  module Inputs
    # class for string inputs
    class StringInput < BaseInput
      def initialize(input)
        super(input)
        attributes = { type: 'text' }.merge(@input[:attributes])
        @input[:value_stored_as_attribute?] = true
        @input[:attributes] = { name: @input[:name] }.merge(attributes)
      end
    end
  end
end
