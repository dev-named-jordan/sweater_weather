require 'rails_helper'

RSpec.describe 'Background API Facade', type: :request do
  it 'Can get background', :vcr do

    location = "denver,co"
    response = BackgroundFacade.get_background(location)



    expect(response.credit).to be_a(Hash)
    expect(response.credit.count).to eq(2)
    expect(response.credit[:source]).to be_a(String)
    expect(response.credit[:author]).to be_a(String)
    expect(response.location).to be_a(String)
    expect(response.url).to be_a(String)
  end
end
