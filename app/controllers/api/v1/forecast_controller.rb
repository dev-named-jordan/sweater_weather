class Api::V1::ForecastController < ApplicationController
  def index
    # JSON.parse(request.body.read, symbolize_names: true)
    location = params[:location]
    if location.blank?
      render json: {'Message': {'Error': 'No City Provided'}}, status: :bad_request
    else
      forecast = ForecastFacade.get_forecast(location)
      render json: ForecastSerializer.new(forecast)
    end
  end
end
