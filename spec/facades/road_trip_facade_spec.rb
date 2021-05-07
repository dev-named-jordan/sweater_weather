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
  it 'Can get destination weather eta for RoadTrip', :vcr do

    seconds = 6781
    destination = "pueblo,co"
    response = RoadTripFacade.destination_weather_eta(seconds, destination)

    expect(response).to be_a(HourlyWeather)
    expect(response.conditions).to be_a(String)
    expect(response.icon).to be_a(String)
    expect(response.time).to be_a(String)
    expect(response.temp).to be_a(Numeric)
  end
  it 'Can get realt time trip route for RoadTrip in seconds', :vcr do

    origin = "denver,co"
    destination = "pueblo,co"
    response = RoadTripFacade.trip_route(origin, destination)

    expect(response).to be_a(Integer)
  end
  it 'Can get real day hour and minute format for trip travel time', :vcr do

    origin = "denver,co"
    destination = "pueblo,co"
    response = RoadTripFacade.get_travel_time(origin, destination)

    expect(response).to be_a(String)
  end
  it 'Can get real day hour and minute format for trip travel time for long trip', :vcr do

    origin = "los angeles,ca"
    destination = "new york city, ny"
    response = RoadTripFacade.get_travel_time(origin, destination)
    expect(response).to be_a(String)
  end
end
