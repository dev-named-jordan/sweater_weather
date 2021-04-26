class Salary

attr_reader :title, :min, :max

  def initialize(salary_data)
    @title = salary_data[:job][:title]
    @min = convert_min(salary_data)
    @max = convert_max(salary_data)
  end

  def convert_min(salary_data)
    a = salary_data[:salary_percentiles][:percentile_25]
    a.round(2).to_s.chars.unshift("$").join
  end

  def convert_max(salary_data)
    a = salary_data[:salary_percentiles][:percentile_75]
    a.round(2).to_s.chars.unshift("$").join
  end
end
