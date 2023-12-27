# frozen_string_literal: true

module HexletCode
  module Inputs
    # class for text inputs
    class TextInput < BaseInput
      def initialize(input)
        super(input)
        attributes = { cols: '20', rows: '40' }.merge(@input[:attributes])
        @input[:attributes] = { name: @input[:name] }.merge(attributes)
      end
    end
  end
end
