# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'favro_api/version'

Gem::Specification.new do |spec|
  spec.name          = "favro_api"
  spec.version       = FavroApi::VERSION
  spec.authors       = ["Sergey Besedin"]
  spec.email         = ["kr3ssh@gmail.com"]

  spec.summary       = %q{Favro API}
  spec.description   = %q{Written in ruby}
  spec.homepage      = "https://github.com/kressh/favro_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.10"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
