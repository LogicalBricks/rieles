# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rieles/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Azarel Doroteo Pacheco"]
  gem.email         = ["azarel.doroteo@logicalbricks.com"]
  gem.description   = %q{Instala el archivo de inflections para pluralizar y singularizar según las reglas en Español, incluye el locale en Español y agrega templates erb/haml para que el scaffold genere las vistas en Español.}
  gem.summary       = %q{Instala inflections, locales y templates de scaffold para trabajar en Español.}
  gem.homepage      = ""       


  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rieles"
  gem.require_paths = ["lib"]
  gem.version       = Rieles::VERSION

  gem.add_dependency 'activesupport', '~> 5.0'

  gem.add_development_dependency 'generator_spec'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'pry'
end
