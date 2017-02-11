require 'spec_helper'

describe Review do
  it { should belong_to(:user) }
  it { should belong_to(:business) }
  it { should validate_presence_of(:comment) }
  it { should validate_presence_of(:rating) }

  context "#recent" do

    it "returns an empty array if there are no reviews" do
      expect(Review.recent).to eq([])
    end

    context "with reviews" do
      it "should return the 10 most recently created reviews" do
        business = Fabricate(:business)
        user = Fabricate(:user)
        review1 = Fabricate(:review, user_id: user.id, business_id: business.id)
        review2 = Fabricate(:review, user_id: user.id, business_id: business.id)  
        review3 = Fabricate(:review, user_id: user.id, business_id: business.id)  
        review4 = Fabricate(:review, user_id: user.id, business_id: business.id)  
        review5 = Fabricate(:review, user_id: user.id, business_id: business.id)
        review6 = Fabricate(:review, user_id: user.id, business_id: business.id)
        review7 = Fabricate(:review, user_id: user.id, business_id: business.id)  
        review8 = Fabricate(:review, user_id: user.id, business_id: business.id)  
        review9 = Fabricate(:review, user_id: user.id, business_id: business.id)
        review10 = Fabricate(:review, user_id: user.id, business_id: business.id)  
        review11 = Fabricate(:review, user_id: user.id, business_id: business.id)          
        expect(Review.recent.length).to eq(10)
      end

      it "should return the reviews in order of most recent to least recent" do
        business = Fabricate(:business)
        user = Fabricate(:user)
        review1 = Fabricate(:review, user_id: user.id, business_id: business.id)
        review2 = Fabricate(:review, user_id: user.id, business_id: business.id)  
        review3 = Fabricate(:review, user_id: user.id, business_id: business.id)  
        review4 = Fabricate(:review, user_id: user.id, business_id: business.id)  
        review5 = Fabricate(:review, user_id: user.id, business_id: business.id)
        review6 = Fabricate(:review, user_id: user.id, business_id: business.id)
        review7 = Fabricate(:review, user_id: user.id, business_id: business.id)  
        review8 = Fabricate(:review, user_id: user.id, business_id: business.id)  
        review9 = Fabricate(:review, user_id: user.id, business_id: business.id)
        review10 = Fabricate(:review, user_id: user.id, business_id: business.id)  
        review11 = Fabricate(:review, user_id: user.id, business_id: business.id)                    
        expect(Review.recent).to match_array([review11, review10, review9, review8, review7, review6, review5, review4, review3, review2])   
      end
    end
  end
end