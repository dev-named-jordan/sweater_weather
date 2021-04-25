class Api::V1::BackgroundsController < ApplicationController
  def index
    location = params[:location]
    if location.blank?
      render json: {'Message': {'Error': 'No City Provided'}}, status: :bad_request
    else
      # forecast = BackgroundFacade.get_background(location)
      # render json: BackgroundSerializer.new(forecast)
      BackgroundService.get_location(location)
    end
  end
end
