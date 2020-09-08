require "sinatra"
require "json"
require "logger"

class WebApp < Sinatra::Base
  enable :static
  enable :logging

  set :environment, ENV.fetch("APP_ENV", "development").to_sym
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

    logger.info "^*^*^*^*^*^ - " + request.host

    erb :index, locals: {
                  version: settings.version,
                  environment: settings.environment,
                  build: ENV["BUILD_START_TIME"],
                  host: request.host,
                }
  end

  get "/health-checks" do
    content_type :json
    { status: :ok }.to_json
  end
end
