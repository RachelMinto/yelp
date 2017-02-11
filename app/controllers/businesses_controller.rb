class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)

    if @business.save
      redirect_to businesses_path
    else
      render 'new'
    end
  end

  def show
    @business = Business.find(params[:id])
    @reviews = @business.reviews
  end

  private

  def business_params
    params.require(:business).permit(:company_name, :address, :city, :state, 
      :zipcode, :phone, :bike_parking, :credit_cards, :wheel_chair,
      :mon_start, :mon_end, :tue_start, :tue_end, :wed_start, :wed_end, 
      :thu_start, :thu_end, :fri_start, :fri_end, :sat_start, :sat_end, :sun_start, :sun_end)
  end
end