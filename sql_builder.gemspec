# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sql_builder/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nicholas Stock"]
  gem.email         = ["stockn@gmail.com"]
  gem.description   = 'Follow SQL language paradim to create complex queries'
  gem.homepage      = ""
  gem.summary       = ""
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sql_builder"
  gem.require_paths = ["lib"]
  gem.version       = SqlBuilder::VERSION
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'byebug'
end
