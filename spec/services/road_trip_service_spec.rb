require 'rails_helper'

RSpec.describe 'Road Trip API service', type: :request do
  it 'Can accept data and retutn road trip', :vcr do

    response = RoadTripService.get_route_service('denver', 'pueblo')

    expect(response[:info][:statuscode]).to eq(0)
  end
  it 'wont return image is no location is provided', :vcr do

    response = BackgroundService.get_location('')

    expect(response).to eq({:total=>0, :total_pages=>0, :results=>[]})
  end
end
