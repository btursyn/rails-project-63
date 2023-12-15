# frozen_string_literal: true

module HexletCode
  # class to build content for html form
  class FormContentBuilder
    attr_accessor :object, :output

    def initialize(object, tag_builder)
      @object = object
      @tag_builder = tag_builder
      @output = ''
    end

    def input(tag_name, options = {})
      tag_type = get_tag_type options
      tag_attributes = get_tag_attributes(tag_type, tag_name, options)
      object_field_value = object.public_send(tag_name)

      value_attr = { value: '' }
      value_attr = { value: object_field_value } unless object_field_value.nil?

      label = get_label(tag_name)
      tag = get_tag(tag_type, tag_attributes, value_attr)
      self.output = "#{output}#{label}#{tag}"
      self
    end

    def submit(value = 'Save')
      submit_input = @tag_builder.build('input', { type: 'submit', value: })
      self.output = "#{output}#{submit_input}"
    end

    alias build output

    private

    def get_label(tag_name)
      @tag_builder.build('label', { for: tag_name }) { tag_name.to_s.capitalize }
    end

    def get_tag(tag_type, tag_attributes, value_attr)
      if tag_type == 'input'
        tag_attributes = tag_attributes.merge value_attr
        @tag_builder.build('input', tag_attributes)
      elsif tag_type == 'textarea' && value_attr[:value] == ''
        @tag_builder.build(tag_type, tag_attributes)
      else
        @tag_builder.build(tag_type, tag_attributes) { value_attr[:value] }
      end
    end

    def get_tag_type(options)
      tag_type = 'input'
      tag_type = 'textarea' if options[:as] == :text
      options.delete :as
      tag_type
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
