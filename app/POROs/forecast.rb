class Forecast
  require 'date'
  attr_reader :current_weather, :hourly_weather, :daily_weather, :type, :id

  def initialize(weather_data)
    @id = nil
    @current_weather = CurrentWeather.new(weather_data[:current], weather_data[:timezone_offset])
    @hourly_weather = hourly(weather_data)
    @daily_weather = daily(weather_data)
  end

  def hourly(weather_data)
    expected = weather_data[:hourly][0..7].map do |hour|
      HourlyWeather.new(hour, weather_data[:timezone_offset])
    end
  end

  def daily(weather_data)
    weather_data[:daily][0..4].map do |day|
      DailyWeather.new(day, weather_data[:timezone_offset])
    end
  end
end
