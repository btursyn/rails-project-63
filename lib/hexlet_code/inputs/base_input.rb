# frozen_string_literal: true

module HexletCode
  module Inputs
    # base class for input
    class BaseInput
      attr_reader :label, :input

      def initialize(input)
        @input = input.except(:label)
        @label = input[:label]
      end
    end
  end
end
