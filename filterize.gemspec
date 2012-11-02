# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'filterize/version'

Gem::Specification.new do |gem|
  gem.name          = "filterize"
  gem.version       = Filterize::VERSION
  gem.authors       = ["Chris Gallagher", "John Butler"]
  gem.email         = ["chris.gallagher@betapond.com"]
  gem.description   = %q{Make things puty!}
  gem.summary       = %q{Make things puty!}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'activesupport', '~> 3.2'
  gem.add_dependency 'rmagick', '~> 2.13.1'
  
  gem.add_development_dependency "rspec", "~> 2.6"
  
end
