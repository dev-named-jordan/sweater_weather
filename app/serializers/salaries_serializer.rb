class SalariesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination_url
  set_id { 'null' }
end
