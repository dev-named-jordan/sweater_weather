require 'rails_helper'

RSpec.describe 'Forecast API request', type: :request do
  it 'Using those values it can find the current, hourly and daily weather in a given city', :vcr do
    User.destroy_all

    user = User.create!(email: "email_1@example.com", password: "1234", password_confirmation: "1234", api_key: SecureRandom.hex)

    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "#{user.api_key}"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(body)

    require "pry"; binding.pry
    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected).to be_a(Hash)
  end
end
