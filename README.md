# StringCalculator
StringCalculator is a Ruby gem for performing basic arithmetic operations on numbers provided as strings.
It supports adding numbers separated by commas, newlines, and custom delimiters.

## Installation

To install the gem and add it to your application's Gemfile, execute:
```bash
bundle add string_calculator --git https://github.com/saravanan-personal/string_calculator.git
```

If bundler is not being used to manage dependencies, add this line to your application's Gemfile:
```ruby
gem 'string_calculator', git: 'https://github.com/saravanan-personal/string_calculator.git'
```

## Usage

To use the gem, require it in your Ruby application and call the StringCalculator.add method with your string of numbers.

## Example
  ```ruby
  require 'string_calculator'
  result = StringCalculator.add("1,2,3")
  puts result # => 6
  ```

## Development

After checking out the repo, run bin/setup to install dependencies. Then, run rake spec to run the tests. You can also run bin/console for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run bundle exec rake install. To release a new version, update the version number in version.rb, and then run bundle exec rake release, which will create a git tag for the version, push git commits and the created tag, and push the .gem file to rubygems.org.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
