class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(email: params[:email].downcase, password: params[:password], password_confirmation: params[:password_confirmation], api_key: SecureRandom.hex)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: {'Message': {'Error': "#{user.errors.full_messages}" }}, status: :bad_request
    end
  end
end
