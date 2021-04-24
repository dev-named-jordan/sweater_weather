require 'rails_helper'

RSpec.describe 'Forecast API service', type: :request do
  it 'Can accept coordinates and get forecast from weather service', :vcr do

    coordinates = GeocodeService.get_location('denver,co')
    response = WeatherService.get_weather(coordinates[:lng], coordinates[:lat])

    expect(response).to be_a(Hash)
    expect(coordinates[:lat]).to be_a(Float)
    expect(coordinates[:lng]).to be_a(Float)
    expect(response).to be_a(Hash)
  end
end
