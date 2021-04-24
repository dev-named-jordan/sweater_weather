class DailyWeather

  attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

  def initialize(daily_data, timezone_offset)
    @date = Time.at(daily_data[0][:dt]).getlocal(timezone_offset).to_s
    @sunrise = Time.at(daily_data[0][:sunrise]).getlocal(timezone_offset).to_s
    @sunset = Time.at(daily_data[0][:sunset]).getlocal(timezone_offset).to_s
    @max_temp = daily_data[0][:temp][:max]
    @min_temp = daily_data[0][:temp][:min]
    @conditions = daily_data[0][:weather][0][:description]
    @icon = daily_data[0][:weather][0][:icon]
  end
end
