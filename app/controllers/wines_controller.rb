class WinesController < ApplicationController
  def locations
    @wines = Wine.all
    render json: @wines
  end

  def user_wines_locations
    user_id = params[:user_id]
    @user_wines = User.find(user_id).wines
    render json: @user_wines
  end

  def info
    wine_id = params['id']
    @wine = Wine.find(wine_id)
    render json: @wine
  end
end
