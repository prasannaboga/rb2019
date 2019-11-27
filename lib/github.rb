require 'faraday'

class Github

  attr_accessor :base_url

  def initialize
    @base_url = "https://api.github.com"
  end

  def user(name)
    url  = "#{@base_url}/users/#{name}"
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
