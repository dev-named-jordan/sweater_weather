require 'rails_helper'

RSpec.describe 'User request', type: :request do
  it 'Can create new user' do
    User.destroy_all

    params = {
      "email": "email_1@example.com",
      "password": "1234",
      "password_confirmation": "1234"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    post api_v1_users_path, headers: headers, params: JSON.generate(params)

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(expected).to be_a(Hash)
    expect(expected[:data]).to be_a(Hash)
    expect(expected[:data].count).to eq(3)
    expect(expected[:data][:id]).to be_a(String)
    expect(expected[:data][:type]).to be_a(String)
    expect(expected[:data][:attributes]).to be_a(Hash)
    expect(expected[:data][:attributes].count).to eq(2)
    expect(expected[:data][:attributes][:email]).to be_a(String)
    expect(expected[:data][:attributes][:api_key]).to be_a(String)

    post api_v1_users_path, headers: headers, params: JSON.generate(params)

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
  describe 'sad path' do
    it 'gives error message for missing field' do
      User.destroy_all

      params = {
        "email": "email_2@example.com",
        "password": "",
        "password_confirmation": ""
      }

      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

      post api_v1_users_path, headers: headers, params: JSON.generate(params)

      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
    it 'gives error message for no password confirmation' do
      User.destroy_all

      params = {
        "email": "email_2@example.com",
        "password": "1234",
        "password_confirmation": ""
      }

      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

      post api_v1_users_path, headers: headers, params: JSON.generate(params)

      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
    it 'gives error message for unmatched field' do
      User.destroy_all

      params = {
        "email": "email_3@example.com",
        "password": "1234",
        "password_confirmation": "4321"
      }

      headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

      post api_v1_users_path, headers: headers, params: JSON.generate(params)

      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end
end
