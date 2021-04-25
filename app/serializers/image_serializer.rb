class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :url, :credit
  set_id { 'null' }
end
