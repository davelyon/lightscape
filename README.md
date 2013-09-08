# Lightscape

## Overview

Warning: This is a brand new gem currently, and is likely to undergo
significant changes in the near future. It also does not include any help with
finding your bridge's IP address, or getting an API user set up, you'll have to
figure that out yourself. Support for those features is coming soon.

Lightscape is an API wrapper for the Phillips Hue light bulb bridge. The goal
of this library is to simplify some of the API and make it easier to manage
scenes and lighting presets programatically. There is also an existing gem
(Hue)[https://github.com/soffes/hue] that is a more direct adapter for the same
API.

## Installation

Add this line to your application's Gemfile:

    gem 'lightscape'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lightscape

## Usage

Specify which bridge you'd like to use via environment:

    export BRIDGE=192.168.10.100

Specify a user or use the default "rubyclient"

    export HUE_USER="myusername"

Find a light, and change it:

    light = Lightscape::Light.find(1)
    light.color = :blue
    light.brightness = 255 # Range of (0..255), 0 is _NOT_ off
    light.transition_time = 10 # 10 = (10 * 100ms) or 1 second
    light.update! # Raises the JSON string on failure, or returns true

    light.on! # Turn on immediately
    light.off! # Turn off immediately

## Colors:

In order to get a basic pass at this going, color support is limited to pre-set
colors. This will definitely change as the gem develops.

See `Lightscape::COLORS.keys` for a list of colors

## Coming Soon:

* Setup flow (Currently, you must create a user manually)
* Better methods for setting bridge, user config options
* More colors, and a way to specify your own
* CLI
* Alerting
* Better access to current attributes
* Ability to create/load presets that describe light settings, then apply them to lights by name
* Ability to create/load a "scene" using presets mentioned

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
