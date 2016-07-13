require 'minitest/autorun'
require 'pry'
require './weather'
require 'webmock/minitest'

class WeatherTest < Minitest::Test
  response = File.read("./sf_weather.json")

  stub_request(
  :get,
  "https://api.wunderground.com/api/b7ba232230dd80b0/conditions/q/zmw:94125.1.99999.json"
  ).to_return(body: response, headers: { content_type: "application/json"})

  def test_can_get_conditions
    sf = Weather.new("b7ba232230dd80b0", 94125)
    sf.get_weather
    assert_equal("Partly Cloudy", sf.weather[:conditions]["current_observation"]["weather"])
  end



end
