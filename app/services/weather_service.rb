class WeatherService
  def self.conn
    conn = Faraday.new(url: 'https://api.openweathermap.org')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_weather(longitude, latitude)
    response = conn.get("/data/2.5/onecall") do |f|
      f.params['lat'] = latitude
      f.params['lon'] = longitude
      f.params['exclude'] = 'minutely, alerts'
      f.params['appid'] = ENV['appid']
      f.params['units'] = 'imperial'
    end
    parse(response)
  end
end
