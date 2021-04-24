class DailyWeather

  attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

  def initialize(daily_data, timezone_offset)
    # require "pry"; binding.pry
    @date = Time.at(daily_data[0][:dt]).getlocal(timezone_offset).to_s
  end
end
