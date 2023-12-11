# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/form_content_builder"
# entry level module for gem
module HexletCode
  class Error < StandardError; end
  autoload(:Tag, "./lib/hexlet_code/tag.rb")

  def self.form_for(object, options = {})
    options = get_form_attributes options

    tag_builder = HexletCode::Tag
    form_content_builder = FormContentBuilder.new object, tag_builder
    if !block_given?
      HexletCode::Tag.build("form", options) { "" }
    else
      yield(form_content_builder)
      HexletCode::Tag.build("form", options) { form_content_builder.build }
    end
  end

  def self.get_form_attributes(attributes)
    if attributes.key?(:url)
      attributes[:action] = attributes[:url]
      attributes.delete(:url)
    end

    default_form_attributes = { action: "#", method: "post" }
    (default_form_attributes.keys - attributes.keys).each do |item|
      attributes[item] = default_form_attributes[item]
    end
    attributes
  end

  private_class_method :get_form_attributes
end
