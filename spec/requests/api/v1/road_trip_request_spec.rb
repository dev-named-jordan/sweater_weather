require 'rails_helper'

RSpec.describe 'Forecast API request', type: :request do
  it 'Using those values it can find the current, hourly and daily weather in a given city', :vcr do
    User.destroy_all

    user = User.create!(email: "email_1@example.com", password: "1234", password_confirmation: "1234", api_key: SecureRandom.hex)

    post  "/api/v1/road_trip"

    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "#{user.api_key}"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    post api_v1_sessions_path, headers: headers, params: JSON.generate(user_data)

    expected = JSON.parse(response.body, symbolize_names: true)

# require "pry"; binding.pry
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected).to be_a(Hash)
  end
end
