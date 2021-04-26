  require 'rails_helper'

  RSpec.describe 'Salaries API request', type: :request do
    it 'Can search for a city by name' do

      get "/api/v1/salaries?destination=san+jose"

      destination = JSON.parse(response.body, symbolize_names:true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(destination).to be_a(Hash)
      expect(destination).to have_key(:data)
      expect(destination[:data]).to be_a(Hash)
      expect(destination[:data].count).to eq(3)
      expect(destination[:data][:id]).to be_a(String)
      expect(destination[:data][:type]).to be_a(String)
      expect(destination[:data][:attributes]).to be_a(Hash)
      expect(destination[:data][:attributes].count).to eq(1)
      expect(destination[:data][:attributes][:destination_url]).to be_a(String)
    end
    it 'sad path, black search field' do

      get "/api/v1/salaries?destination="

      destination = JSON.parse(response.body, symbolize_names:true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end
