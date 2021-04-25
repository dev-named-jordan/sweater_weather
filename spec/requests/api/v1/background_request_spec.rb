require 'rails_helper'

RSpec.describe 'Background API request', type: :request do
  it 'Can return an image related to the location specified upon request', :vcr do

    get "/api/v1/backgrounds?location=denver,co"

    picture = JSON.parse(response.body, symbolize_names:true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(picture).to be_a(Hash)
    expect(picture).to have_key(:id)
    expect(picture[:id]).to eq('null')
  end
end
