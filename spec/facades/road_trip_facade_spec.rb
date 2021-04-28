require 'rails_helper'

RSpec.describe 'Road Trip API Facade', type: :request do
  it 'Can make RoadTrip', :vcr do

    origin = "denver,co"
    destination = "pueblo,co"
    response = RoadTripFacade.get_route(origin, destination)

    expect(response).to be_a(RoadTrip)
    expect(response.end_city).to be_a(String)
    expect(response.start_city).to be_a(String)
    expect(response.travel_time).to be_a(String)
    expect(response.weather_at_eta).to be_a(Hash)
    expect(response.weather_at_eta.count).to eq(2)
    expect(response.weather_at_eta[:temperature]).to be_a(Numeric)
    expect(response.weather_at_eta[:conditions]).to be_a(String)
  end
end
