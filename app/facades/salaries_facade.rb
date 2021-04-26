class SalariesFacade
    def self.get_destination(destination)
      salaries_response = SalariesService.get_destination(destination)
      forecast_response = ForecastFacade.get_forecast(destination)
      get_salary = SalariesService.get_salaries(destination)
      Salaries.new(salaries_response, forecast_response, get_salary)
    end
  end
