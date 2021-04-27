class Api::V1::RoadTripController < ApplicationController
  def create

    user = User.find_by(api_key: params[:road_trip][:origin] && params[:road_trip][:destination] &&  params[:road_trip][:api_key]) && (!params[:road_trip][:origin].blank? && !params[:road_trip][:destination].blank?)

    origin = params[:road_trip][:origin]
    destination = params[:road_trip][:destination]

    road_trip = RoadTripFacade.get_route(origin, destination)

    if params[:road_trip][:api_key].blank?
      render json: {'Message': {'Error': "Please register an account" }}, status: 401
    elsif user && origin && destination
      serial = RoadTripSerializer.new(road_trip)
      render json: serial, status: 200
    else
      render json: {'Message': {'Error': "Something is wrong here" }}, status: :bad_request
    end
  end
end
