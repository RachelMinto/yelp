class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @business = Business.find(params[:business_id])
  end
end