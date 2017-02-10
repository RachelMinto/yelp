class Business < ActiveRecord::Base
  validates_presence_of :company_name, :address, :city, :state, :zipcode, :phone
  has_many :reviews           
end