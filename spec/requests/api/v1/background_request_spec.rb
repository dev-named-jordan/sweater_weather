require 'rails_helper'

RSpec.describe 'Background API request', type: :request do
  it 'Can return an image related to the location specified upon request', :vcr do

    # get "/api/v1/forecast?location=denver,co"
    #
    # forecast = JSON.parse(response.body, symbolize_names:true)
    #
    # expect(response).to be_successful
    # expect(response.status).to eq(200)
  end
end
