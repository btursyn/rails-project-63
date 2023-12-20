# frozen_string_literal: true

module HexletCode
  # module for building content of form
  class FormBuilder
    attr_accessor :object, :options, :inner_tags

    def initialize(object, options = {})
      @object = object
      @options = options
      @inner_tags = []
    end

    def form
      attributes = form_attributes(options)
      Model::Form.new(attributes, inner_tags)
    end

    def input(tag_name, options = {})
      inner_tags.push(label(tag_name))

      tag_type = options[:as] == :text ? 'textarea' : 'input'
      options.delete(:as)

      tag_attributes = get_tag_attributes(tag_type, tag_name, options)
      object_field_value = object.public_send(tag_name)

      object_field_value = '' if object_field_value.nil?
      contented = tag_type == 'textarea'

      inner_tags.push(Model::Tag.new(tag_type, tag_attributes, object_field_value, contented:))
      self
    end

    def submit(value = 'Save')
      inner_tags.push(Model::Tag.new('input', { type: 'submit' }, value, contented: false))
      self
    end

    alias build form

    private

    def form_attributes(attributes)
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

    def label(tag_name)
      Model::Tag.new('label', { for: tag_name }, tag_name.to_s.capitalize, contented: true)
    end

    def get_tag_attributes(tag_type, tag_name, options)
      default_attrubites = tag_type == 'input' ? { type: 'text' } : { cols: '20', rows: '40' }
      (default_attrubites.keys - options.keys).each do |key|
        options[key] = default_attrubites[key]
      end
      { name: tag_name }.merge(options)
    end
  end
end
