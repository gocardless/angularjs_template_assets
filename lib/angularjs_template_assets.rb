require "angularjs_template_assets/version"

module AngularJSTemplateAssets

  autoload(:Config, 'angularjs_template_assets/config')
  autoload(:TemplateProcessor, 'angularjs_template_assets/template_processor')

  if defined?(Rails) && defined?(::Rails::Engine)
    require 'angularjs_template_assets/engine'
  else
    require 'sprockets'
    Sprockets.register_engine '.html', TemplateProcessor
  end
end
