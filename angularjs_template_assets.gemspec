# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'angularjs_template_assets/version'

Gem::Specification.new do |gem|
  gem.name          = "angularjs_template_assets"
  gem.version       = AngularJSTemplateAssets::VERSION
  gem.authors       = ["Steve Domin"]
  gem.email         = ["steve@gocardless.com"]
  gem.description   = "Compile HTML templates for AngularJS in the Rails asset pipeline. They're automatically put into the $templateCache"
  gem.summary       = "Compile HTML templates for AngularJS in the Rails asset pipeline."
  gem.homepage      = "https://github.com/gocardless/angularjs_template_assets"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "tilt"
  gem.add_runtime_dependency "sprockets", ">= 2.0.3"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec", "~> 3.9"
end
