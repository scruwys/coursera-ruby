# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coursera/version'

Gem::Specification.new do |spec|
  spec.name          = "coursera"
  spec.version       = Coursera::VERSION
  spec.authors       = ["Scott Cruwys"]
  spec.email         = ["scruwys@gmail.com"]

  spec.summary       = "Thin Ruby wrapper for beta Coursera API"
  spec.description   = "Thin Ruby wrapper for beta Coursera API"
  spec.homepage      = "https://www.github.com/scruwys/coursera-api"
  spec.license       = "MIT"

  spec.files         = Dir.glob("lib/**/*.rb")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "sinatra"
  
  spec.add_dependency "httparty"
end
