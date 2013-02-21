# angularjs_template_assets

`angularjs_template_assets` does two things :

* Prefill Angular.js $templateCache with all the HTML templates in your /assets directory
* Since they’re now Javascrip file they’re compressed and cached as part of the standard assets processing of Rails pipeline.

## Usage with Rails 3.1+

Add `angularjs_template_assets` to your Gemfile in the `assets` group :

```ruby
group :assets do
	gem 'angularjs_template_assets'
end
```

## Usage without Rails 3.1+

Although it hasn't been tested, `angularjs_template_assets` should be working with older version of Rails and with frameworks like Sinatra.

Add `angularjs_template_assets` to your Gemfile :

```ruby
gem 'angularjs_template_assets'
```

Add the `AngularJSTemplateAssets.path` to your `Sprockets::Environment` instance. This lets Sprockets know where the Handlebars JavaScript files are and is required for the next steps to work.

```ruby
env = Sprockets::Environment.new

require 'angularjs_template_assets'
env.append_path AngularJSTemplateAssets.path
```

## TODO

* Write tests
* Allow to customize default namespace