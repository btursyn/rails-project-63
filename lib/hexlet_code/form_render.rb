# frozen_string_literal: true

module HexletCode
  # module for rendering form
  module FormRender
    def self.render_html(form)
      Form.build(form[:form_options]) do
        inputs = ''
        form[:inputs].each do |element|
          input_obj = input element
          inputs = "#{inputs}#{HTML.label input_obj}#{HTML.tag input_obj.input}"
        end
        inputs = "#{inputs}#{HTML.submit(form[:submit])}" unless form[:submit].nil?
        inputs
      end
    end

    def self.input(input)
      if input[:type] == 'string'
        Inputs::StringInput.new(input)
      else
        Inputs::TextInput.new(input)
      end
    end

    # HTML specific methods for rendering
    module HTML
      def self.tag(input)
        html_tag = input[:type] == 'string' ? 'input' : 'textarea'
        if input[:value_stored_as_attribute?]
          Tag.build(html_tag, input[:attributes].merge({ value: input[:value] }))
        else
          Tag.build(html_tag, input[:attributes]) { input[:value] }
        end
      end

      def self.label(input_obj)
        Tag.build('label', { for: input_obj.input[:name] }) { input_obj.label }
      end

      def self.submit(attributes)
        Tag.build('input', { type: 'submit' }.merge(attributes))
      end
    end
  end
end
