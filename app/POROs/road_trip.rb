class RoadTrip
  require 'date'
  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(origin, destination, time, weather)
    @start_city = origin
    @end_city = destination
    @travel_time = time
    @weather_at_eta =  create_weather(weather)
  end

  def create_weather(weather)
    { temperature: weather.temp, conditions: weather.conditions }
  end
end
