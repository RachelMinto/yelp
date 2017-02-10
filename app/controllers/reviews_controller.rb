class ReviewsController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def index

  end

  def new
    @review = Review.new
    @business = Business.find(params[:business_id])
  end

  def create
    @business = Business.find(params[:business_id])
    review = @business.reviews.build(review_params.merge!(user: current_user))

    if review.save
      redirect_to @business
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end