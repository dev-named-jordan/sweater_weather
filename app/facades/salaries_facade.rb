class SalariesFacade
    def self.get_destination(destination)
      salaries_response = SalariesService.get_destination(destination)
      require "pry"; binding.pry
      destination_url_response = SalariesService.get_destination_url(destination)
      forecast_response = ForecastFacade.get_forecast(destination)
      Salaries.new(salaries_response, forecast_response)
    end
  end
