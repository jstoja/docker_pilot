# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docker_pilot/version'

Gem::Specification.new do |spec|
  spec.name          = "docker_pilot"
  spec.version       = DockerPilot::VERSION
  spec.authors       = ["Julien Bordellier"]
  spec.email         = ["git@julienbordellier.com"]
  spec.summary     = "A Rails gem to call the native Docker API in order to manage images and containers."
  spec.description = "The docker daemon has an API which can be called from outside in order to manage ressources like containers and images on the fly. No more need to ssh to manage your docker applications."
  spec.homepage      = "http://github.com/jstoja/docker_pilot"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
