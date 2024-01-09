# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
# require 'bundler/setup'
# Bundler.require
require 'hexlet_code'
require 'minitest/autorun'

def load_html_fixture(file_name)
  html = File.read "#{File.dirname(__FILE__)}/fixtures/#{file_name}"
  html.gsub(/\n|\s{4}/, '')
end
