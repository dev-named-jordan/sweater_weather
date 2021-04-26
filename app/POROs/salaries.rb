class Salaries

attr_reader :destination_url

  def initialize(salaries_response, forecast_response)
    @destination_url = salaries_response[:_embedded][:"city:search-results"][0][:_links][:"city:item"][:href]
    @destination_forecast = forecast_response.current_weather.conditions
  end
end
