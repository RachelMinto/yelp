class ReviewsController < ApplicationController

  def index

  end

  def new
    @review = Review.new
    @business = Business.find(params[:business_id])
  end

  def create
    binding.pry
  end
end