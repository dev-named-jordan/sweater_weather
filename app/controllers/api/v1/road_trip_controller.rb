class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:road_trip][:origin] && params[:road_trip][:destination] &&  params[:road_trip][:api_key])

    origin = params[:road_trip][:origin]
    destination = params[:road_trip][:destination]

    road_trip = RoadTripFacade.get_route(origin, destination)

    if user && origin && destination
      serial = RoadTripSerializer.new(road_trip)
      render json: serial, status: 200
    elsif serial.nil?
      render json: {'Message': {'Error': "Impossibe Route" }}, status: :bad_request
    else
      render json: {'Message': {'Error': "Something is wrong here" }}, status: :bad_request
    end
  end
end
