# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rutube/version'

Gem::Specification.new do |spec|
  spec.name          = "rutube"
  spec.version       = Rutube::VERSION
  spec.authors       = ["Alexander Panasyuk"]
  spec.email         = ["panasmeister@gmail.com"]
  spec.summary       = %q{Rutube API client}
  spec.description   = %q{Rutube API client}
  spec.homepage      = "https://github.com/webrajsc/rutube-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  # spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "oj"
end
