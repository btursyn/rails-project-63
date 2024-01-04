# frozen_string_literal: true

module HexletCode
  # module for generating html tags
  module Tag
    SINGLE_TAGS = %w[img br input]

    def self.build(tag_name, attributes)
      tag = "<#{tag_name}#{build_attributes(attributes)}>"
      return tag if SINGLE_TAGS.include?(tag_name)
      
      "#{tag}#{yield}</#{tag_name}>"
    end

    def self.build_attributes(attributes)
      return '' if attributes.empty?
    
      build_attributes = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      [' ', build_attributes].join
    end
  end
end
