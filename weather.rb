#b7ba232230dd80b0

require "httparty"
require "pry"
class Forecast
  include HTTParty
  base_uri "https://api.forecast.io"
  def initialize(key, lat, lng)
    @key = key
    @lng = lng
    @lat = lat
  end

  def forecast
    self.class.get("/forecast/#{@key}/#{@lat},#{@lng}")
  end




end

f = Forecast.new("c841c27242dd50d1a1744bf123872c95", 38.9059168, -77.0425075)

binding.pry
