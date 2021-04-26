class SalariesFacade
    def self.get_destination(destination)
      response = SalariesService.get_destination(destination)
      Salaries.new(response)
    end
  end
