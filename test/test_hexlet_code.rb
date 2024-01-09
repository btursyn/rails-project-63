# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def setup
    @user = User.new(name: 'rob', job: 'hexlet', gender: 'm')

    @html_form_for_empty_block = load_html_fixture('empty_block.html')
    @html_form_with_url_with_empty_block = load_html_fixture('empty_form_with_url.html')
    @html_form_field_generation = load_html_fixture('form_with_generated_fields.html')
    @html_form_fields_with_additional_attributes = load_html_fixture('form_fields_with_additonal_attributes.html')
    @html_form_with_override_def_field_attributes = load_html_fixture('form_with_override_def_field_attributes.html')
    @html_form_with_empty_submit = load_html_fixture('form_with_empty_submit.html')
    @html_form_with_value_submit = load_html_fixture('form_with_value_submit.html')
  end

  def test_empty_form_with_empty_block
    form = HexletCode.form_for(@user)
    assert { form == @html_form_for_empty_block }
  end

  def test_form_with_url_with_empty_block
    form = HexletCode.form_for(@user, url: '/users')
    assert { form == @html_form_with_url_with_empty_block }
  end

  def test_form_field_generation
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert { form == @html_form_field_generation }
  end

  def test_form_fields_with_additional_attributes
    form = HexletCode.form_for @user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end

    assert { form == @html_form_fields_with_additional_attributes }
  end

  def test_override_field_attribute
    form = HexletCode.form_for @user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert { form == @html_form_with_override_def_field_attributes }
  end

  def test_raise_exception
    assert_raises(NoMethodError) do
      HexletCode.form_for @user, url: '#' do |f|
        f.input :name, class: 'user-input'
        f.input :age
      end
    end
  end

  def test_form_with_empty_submit
    user = User.new job: 'hexlet'

    form_with_empty_submit = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert { form_with_empty_submit == @html_form_with_empty_submit }
  end

  def test_form_with_non_empty_submit
    user = User.new job: 'hexlet'

    form_with_value_submit = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

    assert { form_with_value_submit == @html_form_with_value_submit }
  end
end
