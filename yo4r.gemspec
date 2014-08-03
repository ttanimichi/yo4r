lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yo4r/version'

Gem::Specification.new do |spec|
  spec.name          = "yo4r"
  spec.version       = Yo4r::VERSION
  spec.authors       = ["Tsukuru Tanimichi"]
  spec.email         = ["tanimichi@outlook.jp"]
  spec.summary       = 'A Ruby interface to the Yo API.'
  spec.description   = 'A Ruby interface to the Yo API.'
  spec.homepage      = "https://github.com/tanimichi/yo4r"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", '~> 3.0.0'
  spec.add_development_dependency "unindent"
  spec.add_dependency 'faraday', '~> 0.9.0'
  spec.required_ruby_version = '>= 2.1'
end
