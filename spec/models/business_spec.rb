require 'spec_helper'

describe Business do
  it { should validate_presence_of(:company_name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zipcode) }
  it { should validate_presence_of(:phone) }
  it { should ensure_length_of(:zipcode).is_equal_to(5) }
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

  context "#total_reviews" do
    let(:alice) { Fabricate(:user) }
    let(:business) { Fabricate(:business) }
    let(:business2) { Fabricate(:business) }    

    it "should return number of reviews and ' Reviews' if the user has created multiple reviews" do
      Fabricate(:review, user_id: alice.id, business_id: business.id)
      Fabricate(:review, user_id: alice.id, business_id: business2.id)      
      expect(alice.total_reviews).to eq("2 Reviews")
    end

    it "should return '1 Review' if there is just one review" do
      Fabricate(:review, user_id: alice.id, business_id: business2.id)      
      expect(alice.total_reviews).to eq("1 Review")      
    end
    it "should return 'No Reviews Yet' if there are no reviews" do
      expect(alice.total_reviews).to eq("No Reviews Yet")       
    end         
  end

  context "#recent_review_preview" do
    it "should return the first 170 characters of the latest review with ellipses" do
      business = Fabricate(:business)
      alice = Fabricate(:user)
      review1 = Fabricate(:review, user_id: alice.id, business_id: business.id)
      review2 = Fabricate(:review, user_id: alice.id, business_id: business.id)
      expect(business.recent_review_preview).to eq(review2.comment[0..169] + '...')            
    end
  end

  context "#hours_given?" do
    it "should return false if no hours were given for business" do
      business = Fabricate(:business)
      expect(business.hours_given?).to be(false)
    end

    it "should return true if at least one day has business hours for start and end given" do
      business = Fabricate(:business, sun_end: "8:00 PM", sun_start: '12:00 PM')
      expect(business.hours_given?).to be(true)
    end    
  end
end