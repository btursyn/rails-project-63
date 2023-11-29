# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  # Your code goes here...
  autoload(:Tag, "./lib/hexlet_code/tag.rb")
  HexletCode::Tag.build("img", src: "path/to/image", a: "path/to/image")
  HexletCode::Tag.build("input", type: "submit", value: "Save")
end
