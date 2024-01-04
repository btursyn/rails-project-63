# frozen_string_literal: true

require 'bundler/setup'
require 'active_support/core_ext/string/inflections'

# entry level module for gem
module HexletCode
  class Error < StandardError; end
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'
  autoload :Version, 'hexlet_code/version'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :FormRender, 'hexlet_code/form_render'

  # module for inputs
  module Inputs
    autoload :BaseInput, 'hexlet_code/inputs/base_input'
    autoload :StringInput, 'hexlet_code/inputs/string_input'
    autoload :TextInput, 'hexlet_code/inputs/text_input'
  end

  def self.form_for(object, options = {})
    form_builder = FormBuilder.new(object, options)
    yield(form_builder) if block_given?
    FormRender.render_html(form_builder.form)
  end
end
