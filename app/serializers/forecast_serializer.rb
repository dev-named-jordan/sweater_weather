class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_weather, :hourly_weather, :daily_weather
  attribute type: 'forecast'
  set_id { 'null' }
end
