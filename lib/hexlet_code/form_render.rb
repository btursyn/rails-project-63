# frozen_string_literal: true

module HexletCode
  # module for rendering form
  module FormRender
    def self.render_html(form)
      Form.build(form.attributes) do
        inner_tags = ''
        form.inner_tags.each do |tag_model|
          inner_tags = "#{inner_tags}#{HTML.tag tag_model}"
        end
        inner_tags
      end
    end

    # HTML specific methods for rendering
    module HTML
      def self.tag(tag_model)
        if tag_model.contented
          Tag.build(tag_model.type, tag_model.attributes) { tag_model.value }
        elsif tag_model.value.nil?
          Tag.build(tag_model.type, tag_model.attributes)
        else
          Tag.build(tag_model.type, tag_model.attributes.merge({ value: tag_model.value }))
        end
      end
    end
  end
end
