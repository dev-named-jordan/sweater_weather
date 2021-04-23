class Api::V1::ForecastController < ApplicationController
  def index
    city = params[:location]
    location = GeocodeService.get_location(city)
    render json: GeocodeSerializer.new(location)
  end
end
