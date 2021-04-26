class Salaries

attr_reader :destination_url

  def initialize(response)
    require "pry"; binding.pry
    @destination_url = response[:_embedded][:"city:search-results"][0][:_links][:"city:item"][:href]
  end
end
