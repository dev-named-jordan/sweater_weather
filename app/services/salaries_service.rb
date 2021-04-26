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

  def self.get_slug(destination)
    response = Faraday.get(get_destination_url(destination))
    parse(response)[:_links][:"city:urban_area"][:href]
  end

  def self.get_salaries_url(destination)
    response = Faraday.get(get_slug(destination))
    parse(response)[:_links][:"ua:salaries"][:href]
  end

  def self.get_salaries(destination)
    response = Faraday.get(get_salaries_url(destination))
    parse(response)[:salaries]
  end
end
