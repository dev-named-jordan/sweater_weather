class ForecastFacade
  def self.get_forecast(location)
    coordinate_data = GeocodeService.get_location(location)[:results][0][:locations][0][:latLng]

    longitude = coordinate_data[:lng]
    latitude = coordinate_data[:lat]

    weather_data = WeatherService.get_weather(longitude, latitude)
    Forecast.new(weather_data)
  end

  def self.hourly_unlimited(destination)
    coordinate_data = GeocodeService.get_location(destination)[:results][0][:locations][0][:latLng]
    longitude = coordinate_data[:lng]
    latitude = coordinate_data[:lat]
    weather_data = WeatherService.get_weather(longitude, latitude)
    expected = weather_data[:hourly].map do |hour|
      HourlyWeather.new(hour, weather_data[:timezone_offset])
    end
  end
end
