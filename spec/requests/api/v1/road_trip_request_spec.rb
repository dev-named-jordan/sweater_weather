require 'rails_helper'

RSpec.describe 'Road Trip Request API', type: :request do
  it 'Road Trip can be created for a user', :vcr do
    User.destroy_all

    user = User.create!(email: "email_1@example.com", password: "1234", password_confirmation: "1234", api_key: SecureRandom.hex)

    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "#{user.api_key}"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(body)

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected).to be_a(Hash)
  end
  it 'Road Trip can be created for a user for long trip', :vcr do
    User.destroy_all

    user = User.create!(email: "email_1@example.com", password: "1234", password_confirmation: "1234", api_key: SecureRandom.hex)

    body = {
      "origin": "New York, NY",
      "destination": "Los Angeles, CA",
      "api_key": "#{user.api_key}"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(body)

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected).to be_a(Hash)
  end
  it 'Road Trip cannot be created for an impossible trip', :vcr do
    User.destroy_all

    user = User.create!(email: "email_1@example.com", password: "1234", password_confirmation: "1234", api_key: SecureRandom.hex)

    body = {
      "origin": "New York, NY",
      "destination": "London, UK",
      "api_key": "#{user.api_key}"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(body)

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected).to be_a(Hash)
  end
end
