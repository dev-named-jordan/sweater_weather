class Api::V1::UsersController < ApplicationController
  def create
    require "pry"; binding.pry
    @user = User.new
  end
end
