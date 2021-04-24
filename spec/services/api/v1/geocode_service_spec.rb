require 'rails_helper'

RSpec.describe 'Geocode API service', type: :request do
  it 'can accept name of a city for location request, give me lat/long coordinal values from name of city', :vcr do

    response = GeocodeService.get_location('denver,co')

    expect(response).to be_a(Hash)
    expect(response[:lat]).to be_a(Float)
    expect(response[:lng]).to be_a(Float)
  end
end
