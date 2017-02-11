require 'spec_helper'

describe Business do
  it { should validate_presence_of(:company_name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zipcode) }
  it { should validate_presence_of(:phone) }

  it { should have_many(:reviews) }

  context "#average_rating" do
    let(:business) { Fabricate(:business) }
    let(:user) { Fabricate(:user) }

    it "should return nil if there are no reviews" do
      expect(business.average_rating).to eq(nil)
    end

    it "should return the average of existing reviews" do
      review = Fabricate(:review, rating: 3, business_id: business.id, user_id: user.id)
      review2 = Fabricate(:review, rating: 5, business_id: business.id, user_id: user.id)
      expect(business.average_rating).to eq(4)     
    end

    it "should round to the nearest whole number" do
      review = Fabricate(:review, rating: 3, business_id: business.id, user_id: user.id)
      review2 = Fabricate(:review, rating: 4, business_id: business.id, user_id: user.id)
      expect(business.average_rating).to eq(4)          
    end
  end
end