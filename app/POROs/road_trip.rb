class RoadTrip
  require 'date'
  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(origin, destination, time)
    @start_city = origin
    @end_city = destination
    @travel_time = time
    # @weather_at_eta = a

    # require "pry"; binding.pry

    # @id = nil
    # @current_weather = CurrentWeather.new(weather_data[:current], weather_data[:timezone_offset])
    # @hourly_weather = hourly(weather_data)
    # @daily_weather = daily(weather_data)
  end

  # def self.trip_route(origin, destination)
  #   r = RoadTripService.get_route_service(origin, destination)
  #   # require "pry"; binding.pry
  #   # expected = weather_data[:hourly][0..7].map do |hour|
  #   #   HourlyWeather.new(hour, weather_data[:timezone_offset])
  #   # end
  # end
  #
  # def daily(weather_data)
  #   weather_data[:daily][0..4].map do |day|
  #     DailyWeather.new(day, weather_data[:timezone_offset])
  #   end
  # end
end
