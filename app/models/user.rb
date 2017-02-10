class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :password, :location
  validates_length_of :password, minimum: 8, on: :create
  has_many :reviews

  has_secure_password validations: false

  def last_initial
    "#{self.last_name[0]}."
  end
end