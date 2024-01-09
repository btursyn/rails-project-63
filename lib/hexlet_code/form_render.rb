# frozen_string_literal: true

module HexletCode
  # module for rendering form
  module FormRender
    def self.render_html(form)
      Tag.build('form', form[:form_options]) do
        inputs = form[:inputs].map { |input| build_input(input) }
        if form[:submit]
          submit_tag = Tag.build('input', { type: 'submit' }.merge(form[:submit]))
          inputs.push(submit_tag)
        end
        inputs.join
      end
    end

    def self.build_input(input)
      input_class = "HexletCode::Inputs::#{input[:type].capitalize}Input".constantize
      input_obj = input_class.new(input)

      "#{input_obj.label}#{input_obj.tag}"
    end
  end
end
