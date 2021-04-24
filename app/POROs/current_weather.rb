class CurrentWeather

  attr_reader :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon

  def initialize(current_data, timezone_offset)
    # require "pry"; binding.pry
    # @datetime = Time.at(current_data[0][:dt]).to_time.to_s
    # require "pry"; binding.pry
    @datetime = Time.at(current_data[:dt]).getlocal(timezone_offset).to_s
  end
end
