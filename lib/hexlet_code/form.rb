# frozen_string_literal: true

module HexletCode
  # module for generating html forms
  module Form
    def self.build(attributes = {}, &)
      attributes = get_form_attributes attributes

      if block_given?
        Tag.build('form', attributes, &)
      else
        Tag.build('form', attributes) { '' }
      end
    end

    def self.get_form_attributes(attributes)
      if attributes.key?(:url)
        attributes[:action] = attributes[:url]
        attributes.delete(:url)
      end

      default_form_attributes = { action: '#', method: 'post' }
      (default_form_attributes.keys - attributes.keys).each do |item|
        attributes[item] = default_form_attributes[item]
      end
      attributes
    end

    private_class_method :get_form_attributes
  end
end
