require 'rails_helper'

RSpec.describe 'Forecast API request', type: :request do
  it 'Using those values it can find the current, hourly and daily weather in a given city', :vcr do

    get "/api/v1/forecast?location=denver,co"

    forecast = JSON.parse(response.body, symbolize_names:true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(forecast[:data][:attributes].keys).to match_array [:current_weather, :daily_weather, :hourly_weather]
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
    expect(forecast[:data][:attributes][:current_weather].count).to eq(10)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:dew_point)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:clouds)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_speed)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_deg)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_gust)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:weather)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:feels_like)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:pressure)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:dew_point)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:clouds)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:wind_speed)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:wind_deg)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:wind_gust)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:weather)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:feels_like)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:pressure)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:dew_point)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:clouds)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:wind_speed)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:wind_deg)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:wind_gust)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:weather)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:moonrise)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:moonset)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:moon_phase)
    expect(forecast[:data][:attributes][:daily_weather][0].count).to eq(7)
    expect(forecast[:data][:attributes][:current_weather][:datetime]).to be_a(String)
    expect(forecast[:data][:attributes][:hourly_weather][0].count).to eq(4)
    expect(forecast[:data][:attributes][:hourly_weather]).to be_an(Array)
    expect(forecast[:data][:attributes][:hourly_weather].count).to eq(8)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:time)
    expect(forecast[:data][:attributes][:hourly_weather][0][:time]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather]).to be_a(Array)
    expect(forecast[:data][:attributes][:daily_weather].count).to eq(5)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:date)
    expect(forecast[:data][:attributes][:daily_weather][0][:date]).to be_a(String)
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
    expect(forecast[:data][:attributes][:current_weather][:temperature]).to be_a(Numeric)
    expect(forecast[:data][:attributes][:current_weather][:feels_like]).to be_a(Numeric)
    expect(forecast[:data][:attributes][:current_weather][:humidity]).to be_a(Integer)
    expect(forecast[:data][:attributes][:current_weather][:uvi]).to be_a(Numeric)
    expect(forecast[:data][:attributes][:current_weather][:visibility]).to be_a(Integer)
    expect(forecast[:data][:attributes][:current_weather][:conditions]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather][:icon]).to be_a(String)

    expect(forecast[:data][:attributes][:hourly_weather]).to be_a(Array)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:time)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:temp)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:icon)
    expect(forecast[:data][:attributes][:hourly_weather][0][:time]).to be_a(String)
    expect(forecast[:data][:attributes][:hourly_weather][0][:temp]).to be_a(Numeric)
    expect(forecast[:data][:attributes][:hourly_weather][0][:conditions]).to be_a(String)
    expect(forecast[:data][:attributes][:hourly_weather][0][:icon]).to be_a(String)

    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:date)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:sunset)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:max_temp)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:min_temp)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:icon)
    expect(forecast[:data][:attributes][:daily_weather][0]).to be_a(Hash)
    expect(forecast[:data][:attributes][:daily_weather][0][:date]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][0][:sunrise]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][0][:sunset]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][0][:max_temp]).to be_a(Numeric)
    expect(forecast[:data][:attributes][:daily_weather][0][:min_temp]).to be_a(Numeric)
    expect(forecast[:data][:attributes][:daily_weather][0][:conditions]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][0][:icon]).to be_a(String)
  end
  describe 'sad path for forecast request' do
    it 'Sad Path empty', :vcr do

      get "/api/v1/forecast?location="

      forecast = JSON.parse(response.body, symbolize_names:true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(forecast[:Message][:Error]).to eq('No City Provided')
    end
    it 'Sad Path all numbers in search', :vcr do
    #
    #   get "/api/v1/forecast?location=21321654"
    #
    #   forecast = JSON.parse(response.body, symbolize_names:true)
    #   expect(response).to_not be_successful
    #   expect(response.status).to eq(400)
    #   expect(forecast[:Message][:Error]).to eq('No City Provided')
    end
  end
end
