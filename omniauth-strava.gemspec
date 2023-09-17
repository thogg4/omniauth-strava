# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-strava/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tim Hogg"]
  gem.email         = ["thogg4@gmail.com"]
  gem.description   = %q{OmniAuth strategy for Strava.}
  gem.summary       = %q{OmniAuth strategy for Strava.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-strava"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Strava::VERSION

  gem.add_dependency 'omniauth', '~> 2.0'
  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
