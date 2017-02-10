class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :password, :location

  has_secure_password validations: false
end