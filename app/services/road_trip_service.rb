class RoadTripService
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_route_service(origin, destination)
    response = conn.get('/directions/v2/route') do |f|
      f.params['key'] = ENV['geo_key']
      f.params['from'] = origin
      f.params['to'] = destination
    end
    parse(response)
  end
end
