class ReviewsController < ApplicationController

  # '/restaurants/:restaurant_id/reviews/new'
  # def new
  #   @review = Review.new
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  # end

  # POST '/restaurants/:restaurant_id/reviews' (only from a form)
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save
    respond_to do |format|
      format.html { redirect_to restaurant_path(@restaurant) }
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("reviews",
          partial: 'reviews/index',
          locals: {
            restaurant: @restaurant,
            review: Review.new
          }
        )
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
