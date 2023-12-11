# frozen_string_literal: true

module HexletCode
  # module for generating html tags
  module Tag
    def self.build(tag_name, attributes)
      result_attributes = attributes.reduce('') do |acc, (key, value)|
        acc + "#{key}=\"#{value}\" "
      end
      tag = "<#{tag_name} #{result_attributes.chop}>"
      tag = "#{tag}#{yield}</#{tag_name}>" if block_given?
      tag
    end
  end
end
