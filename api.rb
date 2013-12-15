require 'rack'

class ApiApplication
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    if request.path =~ %r{^/api}
      http = Curl.get(api_url + request.path.gsub('api/', ''))
      return [200, {"Content-Type" => "application/json"}, [http.body]]
    else
      @app.call(env)
    end
  end

  def api_url
    ENV['API_URL']
  end
end
