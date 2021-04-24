class HourlyWeather

  attr_reader :time, :temperature, :conditions, :icon

  def initialize(hourly_data, timezone_offset)
    @time = Time.at(hourly_data[0][:dt]).getlocal(timezone_offset).strftime('%H%M')
    @temp = hourly_data[0][:temp]
    @conditions = hourly_data[0][:weather][0][:description]
    @icon = hourly_data[0][:weather][0][:icon]
  end
end
