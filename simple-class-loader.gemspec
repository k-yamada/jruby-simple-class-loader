# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple-class-loader/version'

Gem::Specification.new do |gem|
  gem.name          = "simple-class-loader"
  gem.version       = Simple::Class::Loader::VERSION
  gem.authors       = ["Kazuhiro Yamada"]
  gem.email         = ["kyamada@sonix.asia"]
  gem.description   = "SimpleClassLoader for JRuby"
  gem.summary       = "SimpleClassLoader for JRuby"
  gem.homepage      = "https://github.com/k-yamada/jruby-simple-class-loader"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
end
