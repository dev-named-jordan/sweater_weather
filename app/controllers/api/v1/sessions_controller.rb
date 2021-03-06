class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      serial = UserSerializer.new(user)
      render json: serial, status: 200
    else
      render json: {'Message': {'Error': "Credentials are bad, and you should feel bad" }}, status: :bad_request
    end
  end
end
