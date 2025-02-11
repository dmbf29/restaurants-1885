class RestaurantsController < ApplicationController
  # '/restaurants'
  def index
    @restaurants = Restaurant.all
  end

  # '/restaurants/1'
  def show
    # Rails pulls the id from the URL and puts in the params
    @restaurant = Restaurant.find(params[:id])
  end
end
