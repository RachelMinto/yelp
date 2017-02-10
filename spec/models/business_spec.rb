require 'spec_helper'

describe Business do
  it { should validate_presence_of(:company_name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zipcode) }
  it { should validate_presence_of(:phone) }

  it { should have_many(:reviews) }
end