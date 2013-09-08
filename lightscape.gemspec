# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lightscape/version'

Gem::Specification.new do |spec|
  spec.name          = "lightscape"
  spec.version       = Lightscape::VERSION
  spec.authors       = ["Dave Lyon"]
  spec.email         = ["dave@davelyon.net"]
  spec.description   = %q{An API adapter for Phillips Hue lighting system}
  spec.summary       = %q{An API adapter for Phillips Hue lighting system}
  spec.homepage      = "https://github.com/davelyon/lightscape"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rest-client", "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
