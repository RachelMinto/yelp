class Business < ActiveRecord::Base
  validates_presence_of :company_name, :address, :city, :state, :zipcode, :phone
  has_many :reviews

  def average_rating
    return nil if self.reviews.empty?
    sum = 0
    self.reviews.each { |review| sum += review.rating.to_f }

    avg = (sum.to_f / reviews.size.to_f).round
  end           
end