![CI status](https://github.com/btursyn/rails-project-63/actions/workflows/main.yml/badge.svg) ![CI status](https://github.com/btursyn/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)

# HexletCode

Form Generator - is a library that facilitates the convenient creation of forms within website templates.

## Usage

### Code Sample:

```ruby
User = Struct.new(:id, :name, :job)
user = User.new

html = HexletCode.form_for(user, url: '/users') do |f|
  f.input :name
  f.input :job, as: :text
  f.submit
end

puts html

<!-- Output -->
<form action="/users" method="post">
  <label for="name">Name</label>
  <input name="name" value="" type="text">
  <label for="job">Job</label>
  <textarea cols="20" rows="40" name="job"></textarea>
  <input type="submit" value="Create">
</form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/btursyn/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).
