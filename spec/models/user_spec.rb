require 'spec_helper'

describe User do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :location }
  it { should ensure_length_of(:password).is_at_least(8).on(:create) }
  it { should have_many(:reviews) }
  it { should validate_uniqueness_of(:email)}  

  context "#first_name_with_last_initial" do
    it "should return first name and first letter of user's last name followed by period" do
      user = Fabricate(:user, first_name: 'Alice', last_name: 'Marcus')
      expect(user.first_name_with_last_initial).to eq('Alice M.')
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
end