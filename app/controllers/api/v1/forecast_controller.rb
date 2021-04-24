class Api::V1::ForecastController < ApplicationController
  def index
    location = params[:location]
    forecast = ForecastFacade.get_forecast(location)
    render json: ForecastSerializer.new(forecast)

    # def self.conn
    #   conn = Faraday.new(url: 'http://www.mapquestapi.com')
    # end
    #
    # def self.parse(response)
    #   JSON.parse(response.body, symbolize_names: true)
    # end
    #
    # def self.get_location(location)
    #   response = conn.get('/geocoding/v1/address') do |f|
    #     f.params['key'] = ENV['geo_key']
    #     f.params['location'] = "denver,co"
    #   end
    #   # require "pry"; binding.pry
    #   parse(response)[:results][0][:locations][0][:latLng]
    # end

    # coordinate_data = get_location(location)
    #
    # longitude = coordinate_data[:lng]
    # lattitude = coordinate_data[:lat]
    #
    # def self.get_forecast(longitude, lattitude)
    #   # require "pry"; binding.pry
    # end
    #



    # forecast = get_forecast(coordinates[:lng], coordinates[:lat])
    # location = GeocodeService.get_location(city)
    # location[:results][0][:locations][0][:latLng]
    # json_location = render json: GeocodeSerializer.new(location)
    # json_location
  end
end
