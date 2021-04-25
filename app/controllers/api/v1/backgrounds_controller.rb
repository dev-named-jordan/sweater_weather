class Api::V1::BackgroundsController < ApplicationController
  def index
    location = params[:location]

    F = Faraday.get("https://api.unsplash.com/search/photos/?query=#{location}&page=1&per_page=1&client_id=F1hxeGt0yoGf238JgMtdBfJk90Zv41_6R5ggxbfDArY")
require "pry"; binding.pry



    # def self.conn
    #   Faraday.new(url: 'https://api.unsplash.com')
    # end
    #
    # def self.parse(response)
    #   JSON.parse(response.body, symbolize_names: true)
    # end
    #
    # def self.get_location(location)
    #   response = conn.get('/search/photos/') do |f|
    #     f.params['client_id'] = ENV['client_id']
    #     f.params['query'] = "location"
    #     f.params['page'] = 1
    #     f.params['per_page'] = 1
    #   end
    #   # parse(response)[:results][0][:locations][0][:latLng]
    # end
    # get_location
    # location = params[:location]
    # if location.blank?
    #   render json: {'Message': {'Error': 'No City Provided'}}, status: :bad_request
    # else
    #   forecast = ForecastFacade.get_forecast(location)
    #   render json: ForecastSerializer.new(forecast)
    # end
  end
end
