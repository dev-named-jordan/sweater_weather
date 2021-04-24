require 'rails_helper'

RSpec.describe 'Forecast API request', type: :request do
  it 'can accept name of a city for location request, give me lat/long coordinal values from name of city', :vcr do

    response = GeocodeService.get_location('denver,co')

    expect(response).to be_a(Hash)
    expect(response[:lat]).to be_a(Float)
    expect(response[:lng]).to be_a(Float)
  end
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
    expect(forecast[:data][:type]).to eq("forecast")
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
    expect(forecast[:data][:attributes][:current_weather].count).to eq(10)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(forecast[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather][:sunset]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
    expect(forecast[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
    expect(forecast[:data][:attributes][:current_weather][:humidity]).to be_a(Integer)
    expect(forecast[:data][:attributes][:current_weather][:uvi]).to be_a(Float)
    expect(forecast[:data][:attributes][:current_weather][:visibility]).to be_a(Integer)
    expect(forecast[:data][:attributes][:current_weather][:conditions]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather][:icon]).to be_a(String)

    expect(forecast[:data][:attributes][:hourly_weather]).to be_a(Hash)
    expect(forecast[:data][:attributes][:hourly_weather]).to have_key(:time)
    expect(forecast[:data][:attributes][:hourly_weather]).to have_key(:temp)
    expect(forecast[:data][:attributes][:hourly_weather]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:hourly_weather]).to have_key(:icon)
    expect(forecast[:data][:attributes][:hourly_weather][:time]).to be_a(String)
    expect(forecast[:data][:attributes][:hourly_weather][:temp]).to be_a(Float)
    expect(forecast[:data][:attributes][:hourly_weather][:conditions]).to be_a(String)
    expect(forecast[:data][:attributes][:hourly_weather][:icon]).to be_a(String)

    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:date)
    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:sunset)
    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:max_temp)
    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:min_temp)
    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:icon)
    expect(forecast[:data][:attributes][:daily_weather]).to be_a(Hash)
    expect(forecast[:data][:attributes][:daily_weather][:date]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][:sunrise]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][:sunset]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][:max_temp]).to be_a(Float)
    expect(forecast[:data][:attributes][:daily_weather][:min_temp]).to be_a(Float)
    expect(forecast[:data][:attributes][:daily_weather][:conditions]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][:icon]).to be_a(String)
  end
end
