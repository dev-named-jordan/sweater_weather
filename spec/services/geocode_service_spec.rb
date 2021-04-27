require 'rails_helper'

RSpec.describe 'Geocode API service', type: :request do
  it 'can accept name of a city for location request, give me lat/long coordinal values from name of city', :vcr do

    response = GeocodeService.get_location('denver,co')[:results][0][:locations][0][:latLng]

    expect(response).to be_a(Hash)
    expect(response.count).to eq(2)
    expect(response[:lat]).to be_a(Float)
    expect(response[:lng]).to be_a(Float)
  end
  it 'sad path no input', :vcr do

    response = GeocodeService.get_location('')

    expect(response[:info][:statuscode]).to eq(400)
  end
  it 'sad path bad input', :vcr do

    response = GeocodeService.get_location('lkjsadflkjaiain932948')

    expect(response[:info][:statuscode]).to eq(0)
  end
end
