require 'bundler'
require 'dotenv/load'

Bundler.require

ENV['BUILD_START_TIME'] = DateTime.now.strftime('%Y.%m.%d.%H.%M.%S')

require './app/app'
require './app/page_requests'

map('/page_requests') { run PageRequests }
map('/') { run WebApp }
