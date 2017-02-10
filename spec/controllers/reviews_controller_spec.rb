require 'spec_helper'

describe ReviewsController do
  let(:business) { Fabricate(:business) }

  describe 'GET new' do
    it "sets @review" do
      get :new, business_id: business.id
      expect(assigns(:review)).to be_instance_of(Review)
    end

    it "sets @business" do
      get :new, business_id: business.id
      expect(assigns(:business)).to eq(business)
    end    
  end
  
end