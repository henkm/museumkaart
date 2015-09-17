# Museumkaart

Query the museumjaarkaart database for museums in The Netherlands. The is fetched from a xml feed from museumjaarkaart.nl.

## Installation

Add this line to your application's Gemfile:

    gem 'museumkaart'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install museumkaart

## Usage

For now, this gem has limitited search functionality:

- location based (latitude, longitude, distance)
- query based
- combined

## Examples

```ruby
# Find van Gogh museum
@museums = Museumkaart.search(keyword: "Van Gogh Museum")

# Find museums in a certain area
@museums = Museumkaart.search(latitude: "52.222687", latitude: "5.483039", distance: 3)

@museums.first # => #<Museumkaart::Museum:0x007fe1532d9178 @id=10455, @title="NIJKERK", @sub_title="Museum Nijkerk", @description="x", @detail_url="/museum/Museum+Nijkerk/Museum+Nijkerk.aspx">

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
