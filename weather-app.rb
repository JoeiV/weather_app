## Weather App using the Yahoo Weather API 

require 'yahoo_weatherman'

## Prompt user for their location zip code 
puts "Input your zipcode to see your current weather forecast"
location = gets.chomp

def get_location(location)
    client = Weatherman::Client.new
    client.lookup_by_location(location)
end

weather = get_location(location)

today = Time.now.strftime('%w').to_i 
   
weather.forecasts.each do |forecast| 

day = forecast['date']

## Change today & tomorrow's forecast to read 'Today' & 'Tomorrow
    ## See http://apidock.com/ruby/DateTime/strftime for more info on strftime
weekday = day.strftime('%w').to_i     

    if weekday == today
        dayName = 'Today'
    elsif weekday == today + 1
        dayName = 'Tomorrow'
    else
        dayName = day.strftime('%A')
    end

## Added below code to convert temperature from celcius default to fahrenheit
temp_low = (forecast['low'] * 1.8) +32
temp_high = (forecast['high'] * 1.8) +32
    
puts dayName + ' is going to be ' + forecast['text'].downcase + ' with a low of ' + temp_low.to_s + ' F and a high of ' + temp_high.to_s + ' F'
end
