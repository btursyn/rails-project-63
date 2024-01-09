# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'

# entry level module for gem
module HexletCode
  class Error < StandardError; end
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'
  autoload :Version, 'hexlet_code/version'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :FormRender, 'hexlet_code/form_render'
  autoload :Inputs, 'hexlet_code/inputs.rb'

  def self.form_for(object, options = {})
    form_builder = FormBuilder.new(object, options)
    yield(form_builder) if block_given?
    FormRender.render_html(form_builder.form)
  end
end
