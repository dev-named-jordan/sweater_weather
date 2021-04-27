class RoadTripService
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_route(from, to)
    response = conn.get('/directions/v2/route') do |f|
      f.params['key'] = ENV['geo_key']
      f.params['from'] = "denver,co"
      f.params['location'] = "denver,co"
    end
    parse(response)
  end
end
http://www.mapquestapi.com/directions/v2/route?key=1uSJxC1Ck8wQ9ln5JymJJWjSzl27lJ43&from=union station denver colorado&to=garden of the gods colroado springs colorado
