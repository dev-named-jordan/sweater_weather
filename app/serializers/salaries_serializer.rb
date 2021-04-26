class SalariesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :forecast, :destination, :salaries
  set_id { 'null' }
end
