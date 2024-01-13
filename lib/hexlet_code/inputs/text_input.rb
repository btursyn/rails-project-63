# frozen_string_literal: true

module HexletCode
  module Inputs
    # class for text inputs
    class TextInput < BaseInput
      DEFAULT_COLS = 20
      DEFAULT_ROWS = 40

      def initialize(input)
        super(input)

        attributes =
          {
            name: @input[:name],
            cols: DEFAULT_COLS,
            rows: DEFAULT_ROWS
          }

        @input[:attributes] = attributes.merge(@input[:attributes])
      end

      def tag
        Tag.build('textarea', @input[:attributes]) { @input[:value] }
      end
    end
  end
end
