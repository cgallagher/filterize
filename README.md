# Filterize

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'filterize'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install filterize

## Usage

  dir = File.dirname(File.expand_path(__FILE__))
  img = File.open("#{dir}/borat.png", 'r')
  overlay_image = File.open("#{dir}/overlay.png", 'r')
  factory = Filterize::Factory.new(img).overlay_image(overlay_image, 100, 100)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
