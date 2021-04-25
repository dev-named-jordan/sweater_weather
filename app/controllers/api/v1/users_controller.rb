class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(email: params[:email].downcase, password: params[:password], password_confirmation: params[:password_confirmation], api_key: SercureRandom.hex)
    if user.save
      serial = UserSerializer.new(user)
      render json: @serial, status: 201
    else
      render json: not sure
    end
  end
end
