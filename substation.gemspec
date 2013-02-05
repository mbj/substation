# -*- encoding: utf-8 -*-

require File.expand_path('../lib/substation/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "substation"
  gem.version     = Substation::VERSION
  gem.authors     = [ "Martin Gamsjaeger (snusnu)" ]
  gem.email       = [ "gamsnjaga@gmail.com" ]
  gem.description = "Handle rails controller methods with dedicated classes"
  gem.summary     = gem.description
  gem.homepage    = "https://github.com/snusnu/substation"

  gem.require_paths    = [ "lib" ]
  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[LICENSE README.md TODO]

  gem.add_dependency 'inflecto', '~> 0.0.2'

  gem.add_development_dependency 'rake',  '~> 10.0.3' 
  gem.add_development_dependency 'rspec', '~> 2.12.0' 
end
