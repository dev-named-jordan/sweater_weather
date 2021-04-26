class Salaries

attr_reader :forecast, :destination, :salaries

  def initialize(destination_response, forecast_response, salaries_response)
    @destination = destination_response[:_embedded][:"city:search-results"][0][:matching_full_name]
    @forecast = { summary: forecast_response.current_weather.conditions, temperature: forecast_response.current_weather.temperature }
    require "pry"; binding.pry
    @salaries = salaries_response
  end
end
