# frozen_string_literal: true

module HexletCode
  module Inputs
    # base class for input
    class BaseInput
      attr_reader :input

      def initialize(input)
        @input = input.except(:label)
        @label = input[:label]
      end

      def label()
        Tag.build('label', { for: @input[:name] }) { @label }
      end
    end
  end
end
