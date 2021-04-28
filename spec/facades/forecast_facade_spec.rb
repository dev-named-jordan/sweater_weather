require 'rails_helper'

RSpec.describe 'Background API Facade', type: :request do
  it 'Can get current forecast', :vcr do

    location = "denver,co"
    response = ForecastFacade.get_forecast(location)

    expect(response.current_weather).to be_a(CurrentWeather)
    expect(response.current_weather.conditions).to be_a(String)
    expect(response.current_weather.datetime).to be_a(String)
    expect(response.current_weather.feels_like).to be_a(Numeric)
    expect(response.current_weather.humidity).to be_a(Numeric)
    expect(response.current_weather.icon).to be_an(String)
    expect(response.current_weather.sunrise).to be_an(String)
    expect(response.current_weather.sunset).to be_an(String)
    expect(response.current_weather.temperature).to be_an(Numeric)
    expect(response.current_weather.uvi).to be_an(Numeric)
    expect(response.current_weather.visibility).to be_an(Numeric)
  end
  it 'Can get hourly forecast', :vcr do

    location = "denver,co"
    response = ForecastFacade.get_forecast(location)

    expect(response.hourly_weather).to be_an(Array)
    expect(response.hourly_weather.first).to be_a(HourlyWeather)
    expect(response.hourly_weather.count).to eq(8)
    expect(response.hourly_weather.first.conditions).to be_a(String)
    expect(response.hourly_weather.first.icon).to be_a(String)
    expect(response.hourly_weather.first.temp).to be_a(Numeric)
    expect(response.hourly_weather.first.time).to be_a(String)
  end
  it 'Can get Daily forecast', :vcr do

    location = "denver,co"
    response = ForecastFacade.get_forecast(location)

    expect(response.daily_weather).to be_an(Array)
    expect(response.daily_weather.count).to eq(5)
    expect(response.daily_weather[0].date).to be_a(String)
    expect(response.daily_weather[0].icon).to be_a(String)
    expect(response.daily_weather[0].max_temp).to be_a(Numeric)
    expect(response.daily_weather[0].min_temp).to be_a(Numeric)
    expect(response.daily_weather[0].sunrise).to be_a(String)
    expect(response.daily_weather[0].sunset).to be_a(String)
  end
  it 'Can get hourly_unlimited', :vcr do

    destination = "pueblo,co"
    response = ForecastFacade.hourly_unlimited(destination)

    expect(response).to be_an(Array)
    expect(response.count).to eq(48)
    expect(response.first.conditions).to be_a(String)
    expect(response.first.icon).to be_a(String)
    expect(response.first.time).to be_a(String)
    expect(response.first.temp).to be_a(Numeric)
  end
end
