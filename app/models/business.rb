class Business < ActiveRecord::Base
  validates_presence_of :company_name, :address, :city, :state, :zipcode, :phone
  validates :zipcode, length: { is: 5 }
  has_many :reviews

  def average_rating
    return nil if self.reviews.empty?
    sum = 0
    self.reviews.each { |review| sum += review.rating.to_f }

    (sum.to_f / reviews.size.to_f).round
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

  def hours_given?
    !!(mon_start && mon_end || tue_start && tue_end || wed_start && wed_end || thu_start && thu_end || fri_start && fri_end || sat_start && sat_end || sun_start && sun_end)
  end

  def city_state_zipcode
    "#{city}, #{state} #{zipcode}"
  end

  def open_monday?
    mon_start && mon_end
  end

  def open_tuesday?
    tue_start && tue_end
  end

  def open_wednesday?
    wed_start && wed_end
  end

  def open_thursday?
    thu_start && thu_end
  end

  def open_friday?
    fri_start && fri_end
  end

  def open_saturday?
    sat_start && sat_end
  end

  def open_sunday?
    sun_start && sun_end
  end
end
