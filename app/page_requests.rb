require_relative 'app'
require 'store_request'

class PageRequests < WebApp
  get '/' do
    content_type :json
    {status: :ok, request: request.env}.to_json
  end
end

