# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'round_robin_tournament/version'

Gem::Specification.new do |spec|
  spec.name          = 'round_robin_tournament'
  spec.version       = RoundRobinTournament::VERSION
  spec.authors       = ['Sebastien Saunier']
  spec.email         = ['seb@saunier.me']
  spec.summary       = 'Round Robin Tournament schedule for competitions or classroom teams'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/ssaunier/round_robin_tournament'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.4'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec'
end
