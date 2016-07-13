require './weather'

class WeatherParser
  attr_reader :city, :condition, :temp

  def initialize(weather_obj)
    @conditions = weather_obj.weather[:conditions]
    @forecast = weather_obj.weather[:forecast]
    @astronomy = weather_obj.weather[:astronomy]
    @alerts = weather_obj.weather[:alerts]

  end

  def parse_conditions
    @city = @conditions["current_observation"]["display_location"]["full"]
    @condition = @conditions["current_observation"]["weather"]
    @temp = @conditions["current_observation"]["temperature_string"]
    "In #{@city} it is currently #{@condition} with a temperature of #{@temp}."
  end

  def parse_forecast
    fore = []
    @forecast["forecast"]["txt_forecast"]["forecastday"].each do |cast|
      fore.push(cast["title"])
      fore.push(cast["fcttext"])
      fore.push("")
    end
    fore
  end

  def parse_astronomy
    risehour = @astronomy["moon_phase"]["sunrise"]["hour"]
    riseminute = @astronomy["moon_phase"]["sunrise"]["minute"]
    sethour =  = @astronomy["moon_phase"]["sunset"]["hour"]
    setminute = @astronomy["moon_phase"]["sunset"]["minute"]
    "Today's sunrise was at #{risehour}:#{riseminute} AM and tonight's sunset will be at #{sethour}:#{setminute} PM."
  end

  def parse_alerts
    alerts = @alerts["alerts"]
    alert = []
    if alerts == []
      alert = ["There are no weather alerts at this time."]
    else
      alert = alerts
    end
    alert
  end


end


f = Weather.new("b7ba232230dd80b0", 20010)
f.get_weather
g = WeatherParser.new(f)
g.parse_conditions

binding.pry
