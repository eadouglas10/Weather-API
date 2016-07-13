require './weather_parser'

puts "Please enter a zip code for weather information."

zip = gets.chomp

f = Weather.new("b7ba232230dd80b0", zip)
f.get_weather
g = WeatherParser.new(f)

puts g.parse_conditions

g.parse_forecast.each do |day|
  puts day
end

puts g.parse_astronomy

puts g.parse_alerts
