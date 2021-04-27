class Api::V1::RoadTripController < ApplicationController
  def create
    @user_1 = User.find_by(api_key: params[:road_trip][:origin] && params[:road_trip][:destination] &&  params[:road_trip][:api_key])
    # require "pry"; binding.pry

    RoadTripService.get_route(from, to)
    # RoadTripFacade.create_roadtrip
    # if user && user.authenticate(params[:password])
    #   serial = UserSerializer.new(user)
    #   render json: serial, status: 200
    # else
    #   render json: {'Message': {'Error': "Credentials are bad, and you should feel bad" }}, status: :bad_request
    # end
  end
end
