class Salaries

attr_reader :forecast, :destination, :salaries

  def initialize(destination_response, forecast_response, salaries_response)
    @destination = destination_response[:_embedded][:"city:search-results"][0][:matching_full_name]
    @forecast = { summary: forecast_response.current_weather.conditions, temperature: forecast_response.current_weather.temperature }
    @salaries = get_salaries(salaries_response)
  end

  def get_salaries(salaries_response)
    all_salaries = salaries_response.map do |salary|
      Salary.new(salary)
    end
    all_salaries.select do |job|
      job.title == "Data Analyst" ||
      job.title == "Data Scientist" ||
      job.title == "Mobile Developer" ||
      job.title == "QA Engineer" ||
      job.title == "Software Engineer" ||
      job.title == "Systems Administrator" ||
      job.title == "Web Developer"
    end
  end
end
