require 'tilt'

module AngularJSTemplateAssets
  class TemplateProcessor < Tilt::Template
    self.default_mime_type = 'application/javascript'

    def prepare
    end

    def evaluate(scope, locals, &block)
      module_name = scope.logical_path + File.extname(scope.pathname)
      <<-AJST
angular.module('#{module_name}', [])
.run(['$templateCache', function($templateCache) {
    $templateCache.put('#{module_name}',\n '#{escape_content(data)}');
}]);\n
      AJST
    end

    private

    def escape_content(content)
      content
        .gsub(/\\/, "\\\\")
        .gsub(/'/,  %q(\\\'))
        .gsub(/\r?\n/, "\\n\' +\n    \'")
    end
  end
end