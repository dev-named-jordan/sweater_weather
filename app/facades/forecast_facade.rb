class ForecastFacade
  def self.get_forecast(location)
    # require "pry"; binding.pry
    coordinate_data = GeocodeService.get_location(location)
    longitude = coordinate_data[:lng]
    latitude = coordinate_data[:lat]
    weather_data = WeatherService.get_weather(longitude, latitude)
    Forecast.new(weather_data)
  end
end
