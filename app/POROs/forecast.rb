class Forecast
  require 'date'
  attr_reader :current_weather, :hourly_weather, :daily_weather, :type, :id

  def initialize(weather_data)
    # @timezone_offset = data[:timezone_offset]
    @id = nil
    @current_weather = CurrentWeather.new(weather_data[:current], weather_data[:timezone_offset])
    # require "pry"; binding.pry
    @hourly_weather = HourlyWeather.new(weather_data[:hourly], weather_data[:timezone_offset])
    @daily_weather = DailyWeather.new(weather_data[:daily], weather_data[:timezone_offset])
  end
end
