require "sinatra"
require "json"
require "logger"
require "socket"

class WebApp < Sinatra::Base
  enable :static
  enable :logging

  # set :environment, ENV.fetch("APP_ENV", "development").to_sym
  set :version, ENV["VERSION"]
  set :public_folder, File.dirname(__FILE__) + "/public"
  set :logger, Logger.new(STDOUT)
  set :server, :puma

  configure :development do
    register Sinatra::Reloader
  end

  configure :production do
  end

  get "/" do
    @page_title = "Index"
    server_name = Socket.gethostname

    logger.info "^*^*^*^*^*^ - " + server_name

    erb :index, locals: {
                  version: settings.version,
                  environment: settings.environment,
                  build: ENV["BUILD_START_TIME"],
                  server: server_name,
                }
  end

  get "/health-checks" do
    content_type :json
    { status: :ok }.to_json
  end
end
