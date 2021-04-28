require 'rails_helper'

RSpec.describe 'Weather API service', type: :request do
  it 'Can accept coordinates and get forecast from weather service', :vcr do
    coordinates = GeocodeService.get_location('denver,co')[:results][0][:locations][0][:latLng]
    response = WeatherService.get_weather(coordinates[:lng], coordinates[:lat])

    expect(response).to be_a(Hash)
    expect(coordinates[:lat]).to be_a(Float)
    expect(coordinates[:lng]).to be_a(Float)
    expect(response[:timezone]).to be_a(String)
    expect(response[:timezone_offset]).to be_a(Numeric)
    expect(response[:current]).to be_a(Hash)
    expect(response[:current].count).to eq(16)
    expect(response[:hourly]).to be_an(Array)
    expect(response[:hourly].count).to eq(48)
    expect(response[:hourly][0]).to be_a(Hash)
    expect(response[:hourly][0].count).to eq(15)
    expect(response[:daily]).to be_an(Array)
    expect(response[:daily].count).to eq(8)
    expect(response[:daily][0]).to be_an(Hash)
    expect(response[:daily][0].count).to eq(19)
  end
  it 'sad path missing coords', :vcr do
    response = WeatherService.get_weather("", "")

    expect(response[:message]).to eq("Nothing to geocode")
  end
end
