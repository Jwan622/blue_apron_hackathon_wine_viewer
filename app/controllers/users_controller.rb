class UsersController < ApplicationController
  def info
    @users = User.all

    render json: @users
  end
end
