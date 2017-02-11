class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :business

  validates_presence_of :rating, :comment

  def self.recent
    Review.last(10)
  end
end