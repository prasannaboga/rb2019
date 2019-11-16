require 'bundler'
require 'dotenv/load'

Bundler.require

ENV['BUILD_START_TIME'] = DateTime.now.strftime('%Y.%m.%d.%l.%M.%S')

require './app/app'

run App
