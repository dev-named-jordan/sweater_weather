class Salaries

attr_reader :destination_forecast, :destination

  def initialize(salaries_response, forecast_response)
    @destination = salaries_response[:_embedded][:"city:search-results"][0][:matching_full_name]
    @destination_forecast = { summary: forecast_response.current_weather.conditions, temperature: forecast_response.current_weather.temperature }
  end

  
end
