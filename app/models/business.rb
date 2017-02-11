class Business < ActiveRecord::Base
  validates_presence_of :company_name, :address, :city, :state, :zipcode, :phone
  validates :zipcode, length: { is: 5 }
  has_many :reviews

  def average_rating
    return nil if self.reviews.empty?
    sum = 0
    self.reviews.each { |review| sum += review.rating.to_f }

    avg = (sum.to_f / reviews.size.to_f).round
  end

  def total_reviews
    total = reviews.count

    return "No Reviews Yet" if total == 0
    return "1 Review" if total == 1
    return "#{total} Reviews" if total > 1   
  end

  def recent_review_preview
    reviews.last.comment[0..169] + '...'
  end
end