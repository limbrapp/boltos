# Boltos

A faster interface to [Voltos](https://voltos.io) bundle variables.

I'm sure the official interfaces will be faster soon enough, but this is just to keep me happy in the meantime.

## Installation

The gem is named `boltos` - install it, bundle it, use it as a gem dependency.

## Usage

```ruby
# Use an existing bundle
bundle = Boltos::Bundle.new 'secrets'
bundle.set 'SECRET_KEY', 'SECRET_VALUE'
bundle.variables #=> {"SECRET_KEY" => "SECRET_VALUE"}

# Create a new bundle
bundle = Boltos::Bundle.create 'secrets'

# Find or create
bundle = Boltos::Bundle.find_or_create 'secrets'

# Get all bundles
Boltos::Bundle.all
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/limbrup/boltos. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
