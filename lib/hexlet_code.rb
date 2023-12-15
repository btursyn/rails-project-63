# frozen_string_literal: true

# entry level module for gem
module HexletCode
  class Error < StandardError; end
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload :Version, 'hexlet_code/version'
  autoload :FormContentBuilder, 'hexlet_code/form_content_builder'

  def self.form_for(object, options = {})
    options = get_form_attributes options

    tag_builder = HexletCode::Tag
    form_content_builder = HexletCode::FormContentBuilder.new(object, tag_builder)
    if block_given?
      yield(form_content_builder)
      HexletCode::Tag.build('form', options) { form_content_builder.build }
    else
      HexletCode::Tag.build('form', options) { '' }
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
