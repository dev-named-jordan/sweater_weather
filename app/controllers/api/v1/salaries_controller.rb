class Api::V1::SalariesController < ApplicationController
  def index
    location = params[:location]
    if location.blank?
      render json: {'Message': {'Error': 'Invalid Info Provided'}}, status: :bad_request
    else
      response = SalaryFacade.get_teleport(location)
      render json: SalarySerializer.new(response)
    end
  end
end
