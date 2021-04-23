class GeocodeService
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end

  def self.get_location(location)
    response = conn.get('/geocoding/v1/address') do |f|
      f.params['key'] = ENV['geo_key']
      f.params['location'] = location
    end
    parse(response)
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
