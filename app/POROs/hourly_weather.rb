class HourlyWeather

  attr_reader :time, :temperature, :conditions, :icon

  def initialize(hourly_data, timezone_offset)
    # require "pry"; binding.pry
    @time = Time.at(hourly_data[0][:dt]).getlocal(timezone_offset).strftime('%H%M')
  end
end
