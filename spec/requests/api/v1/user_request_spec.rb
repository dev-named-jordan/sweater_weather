require 'rails_helper'

RSpec.describe 'User request', type: :request do
  it 'Can create new user', :vcr do

    POST "/api/v1/users"

    picture = JSON.parse(response.body, symbolize_names:true)

    expect(response).to be_successful
  end
end
