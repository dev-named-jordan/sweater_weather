class BackgroundService
  def self.conn
    Faraday.new(url: 'https://api.unsplash.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_location(location)
    response = conn.get('/search/photos/') do |f|
      f.params['client_id'] = ENV['client_id']
      f.params['query'] = location
      f.params['page'] = 1
      f.params['per_page'] = 1
    end
    parse(response)
  end
end
