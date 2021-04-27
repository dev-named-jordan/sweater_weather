class Api::V1::RoadTripController < ApplicationController
  def create
    @user = User.find_by(api_key: params[:road_trip][:origin] && params[:road_trip][:destination] &&  params[:road_trip][:api_key])

    origin = params[:road_trip][:origin]
    destination = params[:road_trip][:destination]
    
    RoadTripFacade.get_route(origin, destination)
    # RoadTripFacade.create_roadtrip
    # if user && user.authenticate(params[:password])
    #   serial = UserSerializer.new(user)
    #   render json: serial, status: 200
    # else
    #   render json: {'Message': {'Error': "Credentials are bad, and you should feel bad" }}, status: :bad_request
    # end

    # if location.blank?
    #   render json: {'Message': {'Error': 'No City Provided'}}, status: :bad_request
    # else
    #   forecast = ForecastFacade.get_forecast(location)
    #   render json: ForecastSerializer.new(forecast)
    # end
  end
end
