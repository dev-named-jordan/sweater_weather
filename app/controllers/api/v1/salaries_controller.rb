class Api::V1::SalariesController < ApplicationController
  def index
    destination = params[:destination]
    if destination.blank?
      render json: {'Message': {'Error': 'Invalid Info Provided'}}, status: :bad_request
    else
      response = SalariesFacade.get_destination(destination)
      render json: SalariesSerializer.new(response)
    end
  end
end
