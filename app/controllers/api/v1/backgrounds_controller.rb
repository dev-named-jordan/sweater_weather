class Api::V1::BackgroundsController < ApplicationController
  def index
    location = params[:location]
    if location.blank?
      render json: {'Message': {'Error': 'No City Provided'}}, status: :bad_request
    # elsif location.is_a?(Numeric)
    #   render json: {'Message': {'Error': 'No Numbers'}}, status: :bad_request
    else
      background = BackgroundFacade.get_background(location)
      render json: ImageSerializer.new(background)
    end
  end
end
