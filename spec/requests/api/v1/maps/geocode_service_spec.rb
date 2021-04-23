require 'rails_helper'

RSpec.describe 'MapQuest API service' do
  it 'can accept name of a city for location request, give me lat/long coordinal values from name of city', :vcr do

    location = 'denver,co'

    get "/api/v1/forecast?location=#{location}"

    coordinates = JSON.parse(response.body, symbolize_names:true)

    expect(response.status).to be_successful
    expect(coordinates).to be_a(Hash)
  end
end


# RSpec.describe 'MapQuest API service' do
#   describe 'it can accept name of a city for location request' do
#     it 'Can give me lat/long coordinal values from name of city', :vcr do
#
#
#       location = 'denver,co'
# require "pry"; binding.pry
#       response = get "/api/v1/geocoding/#{location}"
#
#       expect(response).to be_successful
#
#       # response = GeocodeService.get_location(location)
#
#       # get ("http://www.mapquestapi.com/geocoding/v1/address?key=1uSJxC1Ck8wQ9ln5JymJJWjSzl27lJ43&location=Denver,co")
#
#       # require "pry"; binding.pry
#     end
#
#     # it '#get_location', :vcr do
#     #   response = GeocodeService.get_location('denver, co')
#     # end
#   end
# end
