require 'grpc'
require 'proto/snip_services_pb'

class SnipService < Snip::UrlSnipService::Service
  def snip_it(snip_req, _unused_call)
    puts "Received URL snip request for #{snip_req.url}"
    Snip::SnipResponse.new(url: snip_req.url)
  end
end
