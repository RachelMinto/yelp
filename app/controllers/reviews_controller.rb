class ReviewsController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def index
    @recent_reviews = Review.recent
  end

  def new
    @review = Review.new
    @business = Business.find(params[:business_id])
  end

  def create
    @business = Business.find(params[:business_id])
    @review = @business.reviews.build(review_params.merge!(user: current_user))

    if @review.save
      flash[:success] = 'Review has been created succesfully.'      
      redirect_to @business
    else
      flash[:error] = 'There was a problem with your review.'
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end