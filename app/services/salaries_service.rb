class SalariesService
  def self.conn
    Faraday.new(url: 'https://api.teleport.org')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_destination(destination)
    response = conn.get("/api/cities/?search=#{destination}") do |f|
      f.params['search'] = destination
    end
    parse(response)
  end

  def self.get_destination_url(destination)
    response = conn.get("/api/cities/?search=#{destination}") do |f|
      f.params['search'] = destination
    end
    parse(response)[:_embedded][:"city:search-results"][0][:_links][:"city:item"][:href]
  end
  
end
