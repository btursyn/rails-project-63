# frozen_string_literal: true

module HexletCode
  module Inputs
    # class for text inputs
    class TextInput < BaseInput
      DEFAULT_ROWS = { rows: '40' }.freeze
      DEFAULT_COLS = { cols: '20' }.freeze
      def initialize(input)
        super(input)
        default_attributes = DEFAULT_COLS.merge DEFAULT_ROWS
        attributes = default_attributes.merge(@input[:attributes])
        @input[:attributes] = { name: @input[:name] }.merge(attributes)
      end

      def tag
        Tag.build('textarea', @input[:attributes]) { @input[:value] }
      end
    end
  end
end
