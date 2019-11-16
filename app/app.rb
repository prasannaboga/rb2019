require 'sinatra'

class App < Sinatra::Base

  enable :static

  set :environment, ENV['APP_ENV'].to_sym
  set :version, ENV['VERSION']
  set :public_folder, File.dirname(__FILE__) + '/public'

  configure :development do
    register Sinatra::Reloader
  end

  configure :production do

  end

  get '/' do
    @page_title = "Index"
    erb :index, locals: {
      version: settings.version,
      environment: settings.environment,
      build: ENV['BUILD_START_TIME']
    }
  end
end
