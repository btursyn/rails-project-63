# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:id, :name, :job)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def setup
    @user = User.new
  end

  def test_empty_form_with_empty_block
    form = HexletCode.form_for(@user) do |f|
    end
    assert_equal form, "<form action=\"#\" method=\"post\"></form>"
  end

  def test_form_with_url_with_empty_block
    form = HexletCode.form_for(@user, url: "/users") do |f|
    end
    assert_equal form, "<form action=\"/users\" method=\"post\"></form>"
  end
end
