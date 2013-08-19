# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'event_api_49st/version'

Gem::Specification.new do |spec|
  spec.name          = "event_api_49st"
  spec.version       = EventApi49st::VERSION
  spec.authors       = ["soheil416"]
  spec.email         = ["soheil@49st.com"]
  spec.description   = %q{Ruby library for accessing the 49st.com API}
  spec.summary       = %q{49st.com provides local events content throughout North American cities. Use this library to add events to your application.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
