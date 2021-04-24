class DailyWeather

  attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

  def initialize(daily_data, timezone_offset)
    @date = Time.at(daily_data[:dt]).getlocal(timezone_offset).to_s
    @sunrise = Time.at(daily_data[:sunrise]).getlocal(timezone_offset).to_s
    @sunset = Time.at(daily_data[:sunset]).getlocal(timezone_offset).to_s
    @max_temp = daily_data[:temp][:max]
    @min_temp = daily_data[:temp][:min]
    @conditions = daily_data[:weather][0][:description]
    @icon = daily_data[:weather][0][:icon]
  end
end
