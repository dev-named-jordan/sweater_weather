class SalariesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination_forecast, :destination
  set_id { 'null' }
end
