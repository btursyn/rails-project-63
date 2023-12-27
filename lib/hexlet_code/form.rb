# frozen_string_literal: true

module HexletCode
  # module for generating html forms
  module Form
    class << self
      def build(attributes = {}, &)
        attributes = get_form_attributes attributes

        if block_given?
          Tag.build('form', attributes, &)
        else
          Tag.build('form', attributes) { '' }
        end
      end

      private

      def get_form_attributes(attributes)
        if attributes.key?(:url)
          attributes[:action] = attributes[:url]
          attributes = attributes.except(:url)
        end

        default_form_attributes = { action: '#' }
        (default_form_attributes.keys - attributes.keys).each do |item|
          attributes[item] = default_form_attributes[item]
        end
        attributes
      end
    end
  end
end
