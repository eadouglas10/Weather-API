#b7ba232230dd80b0
#http://api.wunderground.com/api/b7ba232230dd80b0/forecast/q/zmw:94125.1.99999.json

require "httparty"
require "pry"
class Weather
  include HTTParty
  base_uri "https://api.wunderground.com/api"
  attr_reader :weather
  def initialize(key, zip)
    @key = key
    @zip = zip
    @weather = {}
  end

  def get_weather
    @weather[:conditions] = self.class.get("/#{@key}/conditions/q/zmw:#{@zip}.1.99999.json")
    @weather[:forecast] = self.class.get("/#{@key}/forecast_10_day/q/zmw:#{@zip}.1.99999.json")
    @weather[:astronomy] = self.class.get("/#{@key}/astronomy/q/zmw:#{@zip}.1.99999.json")
    @weather[:alerts] = self.class.get("/#{@key}/alerts/q/zmw:#{@zip}.1.99999.json")
  end

end
