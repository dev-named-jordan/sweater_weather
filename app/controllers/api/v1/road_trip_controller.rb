class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(
      api_key: params[:road_trip][:api_key]
    )

    origin = params[:road_trip][:origin]
    destination = params[:road_trip][:destination]

    road_trip = RoadTripFacade.get_route(origin, destination)
    if params[:road_trip][:api_key].blank? || user.nil?
      render json: {'Message': {'Error': "Please register an account" }}, status: 401
    elsif user && !origin.blank? && !destination.blank?
      serial = RoadTripSerializer.new(road_trip)
      render json: serial, status: 200
    elsif params[:road_trip][:api_key].blank? != user.api_key
      render json: {'Message': {'Error': "Something is wrong here" }}, status: :bad_request
    end
  end
end
