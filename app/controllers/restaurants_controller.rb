class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  # '/restaurants
  # /top'
  def top
    @restaurants = Restaurant.where(rating: 5)
  end

  # '/restaurants/12/chef'
  def chef
    @restaurant = Restaurant.find(params[:id])
  end

  # '/restaurants'
  def index
    # @restaurants = Restaurant.all
    @restaurants = policy_scope(Restaurant)
    respond_to do |format|
      format.html { render 'index'}
      format.json { render json: @restaurants}
    end
  end

  # '/restaurants/1'
  def show
    # Rails pulls the id from the URL and puts in the params
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
    authorize @restaurant
  end

  # '/restaurants/new'
  def new
    # this is for the form builder (with will build the path + method)
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  # we can only trigger this action, by submitting a form
  # it's only purpose is to create, so it doesnt have a view
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant
    if @restaurant.save
      # redirect_to restaurants_path
      redirect_to restaurant_path(@restaurant)
    else
      # if the restaurant doesnt save, we want to show the form again
      # render the form page again aka new.html.erb
      render :new, status: :unprocessable_entity # 422
    end
  end

  # '/restaurants/20/edit'
  def edit
    # this is just for the form
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  # we can only trigger this action, by submitting a form
  # it's only purpose is to update, so it doesnt have a view
  def update
    # load the restaurant using the id from the URL (not the form)
    @restaurant = Restaurant.find(params[:id])
    # update the instance using the data from the form
    authorize @restaurant
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      # if the restaurant doesnt save, we want to show the form again
      # render the form page again aka new.html.erb
      render :edit, status: :unprocessable_entity # 422
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    # for security reasons, we are whitelisting our params
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
