require 'rails_helper'

RSpec.describe 'Forecast API request', type: :request do
  # it 'can accept name of a city for location request, give me lat/long coordinal values from name of city', :vcr do
  #
  # GeocodeService.get_location('denver,co')
  #
  # test for lat long point form above call

  #   # require "pry"; binding.pry
  #   coordinates = JSON.parse(response.body, symbolize_names:true)
  #
  #   expect(response.status).to be_successful
  #   require "pry"; binding.pry
  #   expect(coordinates).to be_a(Hash)
  # end
  it 'Using those values it can find the current, hourly and daily weather in a given city', :vcr do

    get "/api/v1/forecast?location=denver,co"

    forecast = JSON.parse(response.body, symbolize_names:true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(forecast[:data]).to be_a(Hash)
    expect(forecast[:data]).to have_key(:id)
    expect(forecast[:data]).to have_key(:type)
    expect(forecast[:data]).to have_key(:attributes)
    expect(forecast[:data][:id]).to be_a(String)
    expect(forecast[:data][:type]).to be_a(String)
    expect(forecast[:data][:attributes]).to be_a(Hash)
    expect(forecast[:data][:attributes]).to have_key(:current_weather)
    expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
    expect(forecast[:data][:attributes]).to have_key(:daily_weather)
    expect(forecast[:data][:attributes][:current_weather]).to be_a(Hash)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(forecast[:data][:attributes][:current_weather][:datetime]).to be_a(String)
    expect(forecast[:data][:attributes][:hourly_weather]).to be_a(Hash)
    expect(forecast[:data][:attributes][:hourly_weather]).to have_key(:time)
    expect(forecast[:data][:attributes][:hourly_weather][:time]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather]).to be_a(Hash)
    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:date)
    expect(forecast[:data][:attributes][:daily_weather][:date]).to be_a(String)

    # a data attribute, under which all other attributes are present:
# id, always set to null
# type, always set to “forecast”
# attributes, an object containing weather information:
# current_weather, holds current weather data:
# datetime, in a human-readable format such as “2020-09-30 13:27:03 -0600”
# sunrise, in a human-readable format such as “2020-09-30 06:27:03 -0600”
# sunset, in a human-readable format such as “2020-09-30 18:27:03 -0600”
# temperature, floating point number indicating the current temperature in Fahrenheit
# feels_like, floating point number indicating a temperature in Fahrenheit
# humidity, numeric (int or float), as given by OpenWeather
# uvi, numeric (int or float), as given by OpenWeather
# visibility, numeric (int or float), as given by OpenWeather
# conditions, the first ‘description’ field from the weather data as given by OpenWeather
# icon, string, as given by OpenWeather
  end
end
