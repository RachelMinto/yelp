class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :password, :location
  validates_length_of :password, minimum: 8, on: :create

  has_secure_password validations: false
end