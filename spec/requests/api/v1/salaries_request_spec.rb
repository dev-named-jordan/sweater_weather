  require 'rails_helper'

  RSpec.describe 'Teleport API request', type: :request do
    it 'Can search for a city by name' do

      get "/api/v1/salaries?destination=denver,co"

      destination = JSON.parse(response.body, symbolize_names:true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(destination).to be_a(Hash)
      expect(destination).to have_key(:data)
    end
  end
