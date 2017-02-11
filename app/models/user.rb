class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :password, :location
  validates_length_of :password, minimum: 8, on: :create
  validates_uniqueness_of :email
  has_many :reviews

  has_secure_password validations: false

  def first_name_with_last_initial
    "#{self.first_name} #{self.last_name[0]}."
  end

  def total_reviews
    total = self.reviews.count

    return "No Reviews Yet" if total == 0
    return "1 Review" if total == 1
    return "#{total} Reviews" if total > 1   
  end
end