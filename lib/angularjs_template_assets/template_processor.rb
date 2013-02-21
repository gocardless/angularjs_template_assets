require 'tilt'

module AngularJSTemplateAssets
  class TemplateProcessor < Tilt::Template
    self.default_mime_type = 'application/javascript'

    def self.default_namespace
      'angular.module("app")'
    end

    def prepare
      @namespace = self.class.default_namespace
    end

    attr_reader :namespace

    def evaluate(scope, locals, &block)
      <<-AJST
(function() {
  angular.module('app').run(['$templateCache',
    function appConfigTemplateCache($templateCache) {
      $templateCache.put('#{scope.logical_path}#{File.extname(scope.pathname)}', '#{one_line(escape_single_quote(data))}');
  }]);
}).call();
      AJST
    end
    
    private

      def escape_single_quote(string)
        string.gsub(/'/, "\\\\'")
      end

      def one_line(string)
        string.gsub(/\n+\s*/m, ' ')
      end
  end
end