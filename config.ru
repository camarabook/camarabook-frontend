require 'yaml'
require 'bundler/setup'
Bundler.require

class BackboneMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    if request.path !~ %r{^/assets}
      env['REQUEST_PATH'] = '/'
      env['REQUEST_URI'] = '/'
      env['PATH_INFO'] = '/'
    end

    @app.call(env)
  end
end

#asset_paths = ["app/assets/javascripts",
               #"vendor/assets/javascripts",
               #"lib/assets/javascripts",
               #"app/assets/stylesheets",
               #"vendor/assets/stylesheets",
               #"lib/assets/stylesheets"]
#$LOAD_PATH.each do |load_path|
  #asset_paths.each do |asset_path|
    #path = [load_path, '..', asset_path].join("/")
    #Catapult.environment.append_path path if File.directory? path
  #end
#end

require 'handlebars_assets'
HandlebarsAssets::Config.template_namespace = 'JST'
Catapult.environment.append_path HandlebarsAssets.path


use BackboneMiddleware
run Catapult.app
