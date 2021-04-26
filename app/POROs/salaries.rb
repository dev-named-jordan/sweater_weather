class Salaries

attr_reader :destination_url, :destination_forecast, :destination

  def initialize(salaries_response, forecast_response)
    require "pry"; binding.pry
    @destinaiton = ig
    @destination_url = salaries_response[:_embedded][:"city:search-results"][0][:_links][:"city:item"][:href]
    @destination_forecast = forecast_response.current_weather.conditions
  end
end
