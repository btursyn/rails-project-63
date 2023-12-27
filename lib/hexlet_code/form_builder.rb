# frozen_string_literal: true

module HexletCode
  # module for building content of form
  class FormBuilder
    attr_reader :object, :form

    def initialize(object, attributes = {})
      @object = object
      @form = {
        inputs: [],
        submit: nil,
        form_options: { method: 'post' }.merge(attributes)
      }
    end

    def input(name, attributes = {})
      label = attributes.fetch(:label, name.to_s.capitalize)

      input_type = attributes[:as] || 'string'
      attributes = attributes.except(:as)

      object_field_value = object&.public_send(name) || ''
      form[:inputs] << {
        type: input_type, value: object_field_value, name:, attributes:, label:
      }
    end

    def submit(value = 'Save')
      form[:submit] = { value: }
    end
  end
end
