require 'rails_helper'

RSpec.describe 'Background API request', type: :request do
  it 'Can return an image related to the location specified upon request', :vcr do

    get "/api/v1/backgrounds?location=denver,co"

    picture = JSON.parse(response.body, symbolize_names:true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(picture).to be_a(Hash)
    expect(picture).to have_key(:data)
    expect(picture[:data]).to be_a(Hash)
    expect(picture.count).to eq(1)
    expect(picture[:data]).to have_key(:id)
    expect(picture[:data][:id]).to eq("null")
    expect(picture[:data][:id]).to be_a(String)
    expect(picture[:data].count).to eq(3)
    expect(picture[:data]).to have_key(:type)
    expect(picture[:data][:type]).to eq("image")
    expect(picture[:data][:type]).to be_a(String)
    expect(picture[:data]).to have_key(:attributes)
    expect(picture[:data][:attributes]).to be_a(Hash)
    expect(picture[:data][:attributes].count).to eq(3)
    expect(picture[:data][:attributes]).to have_key(:location)
    expect(picture[:data][:attributes][:location]).to be_a(String)
    expect(picture[:data][:attributes][:location]).to eq("denver,co")
    expect(picture[:data][:attributes]).to have_key(:url)
    expect(picture[:data][:attributes][:url]).to be_a(String)
    expect(picture[:data][:attributes]).to have_key(:credit)
    expect(picture[:data][:attributes][:credit]).to be_a(Hash)
    expect(picture[:data][:attributes][:credit]).to have_key(:source)
    expect(picture[:data][:attributes][:credit][:source]).to be_a(String)
    expect(picture[:data][:attributes][:credit].count).to eq(2)
    expect(picture[:data][:attributes][:credit]).to have_key(:author)
    expect(picture[:data][:attributes][:credit][:author]).to be_a(String)
    expect(picture[:id]).to eq(nil)
  end
  describe 'sad path' do
    it 'Render error with blank search', :vcr do
      get "/api/v1/backgrounds?location="

      picture = JSON.parse(response.body, symbolize_names:true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
    # it 'Render error with numbers search', :vcr do
    #   get "/api/v1/backgrounds?location=134654"
    #
    #   picture = JSON.parse(response.body, symbolize_names:true)
    #
    #   expect(response).to_not be_successful
    #   expect(response.status).to eq(400)
    # end
  end
end
