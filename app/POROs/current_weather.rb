class CurrentWeather

  attr_reader :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon

  def initialize(current_data, timezone_offset)
    @datetime = Time.at(current_data[:dt]).getlocal(timezone_offset).to_s
    @sunrise = Time.at(current_data[:sunrise]).getlocal(timezone_offset).to_s
    @sunset = Time.at(current_data[:sunset]).getlocal(timezone_offset).to_s
    @temperature = current_data[:temp]
    @feels_like = current_data[:feels_like]
    @humidity = current_data[:humidity]
    @uvi = current_data[:uvi]
    @visibility = current_data[:visibility]
    @conditions = current_data[:weather][0][:description]
    @icon = current_data[:weather][0][:icon]
  end
end
