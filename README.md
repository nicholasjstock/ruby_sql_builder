# SqlBuilder

SQL DSL runs to_sql on each element when it is instanciated. This means that you cannot pass a complex query around to multiple objects to let each object update it as it may because as soon as sql dsl instanciates a part of the statements it is converted into a string.

This is just code thats been sitting on my laptop for years, there is alot more work to do to make it a real realease.
_

## Installation

Add this line to your application's Gemfile:

    gem 'sql_builder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sql_builder

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
