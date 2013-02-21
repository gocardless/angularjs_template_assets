module AngularJSTemplateAssets
  class Engine < ::Rails::Engine
    initializer "sprockets.angularjs_template", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets
      app.assets.register_engine('.html', TemplateProcessor)
    end
  end
end