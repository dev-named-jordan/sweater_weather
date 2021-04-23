class GeocodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :lattitude, :longitude
end
