require 'spec_helper'

describe ReviewsController do
  let(:business) { Fabricate(:business) }

  describe 'GET index' do
    it "sets @reviews" do
      get :index
      expect(assigns(:recent_reviews)).to be_instance_of(Array)
    end
  end

  describe 'GET new' do
    context "with unauthenticated user" do
      it_behaves_like "requires_authenticated_user" do
        let(:business) { Fabricate(:business) }
        let(:action) { get :new, business_id: business.id }
      end
    end

    context "with authenticated_user" do
      before do
        sign_in_user        
        get :new, business_id: business.id        
      end

      it "sets @review" do
        expect(assigns(:review)).to be_instance_of(Review)
      end

      it "sets @business" do
        expect(assigns(:business)).to eq(business)
      end          
    end
  end

  describe 'POST create' do
    let(:business) { Fabricate(:business) }

    context "with unauthenticated user" do
      it_behaves_like "requires_authenticated_user" do
        let(:business) { Fabricate(:business) }
        let(:action) { get :new, business_id: business.id }
      end
    end    

    context "with authenticated_user" do
      before { sign_in_user }

      context "with invalid inputs" do
        before { post :create, review: { comment: "Meh." }, business_id: business.id }

        it "sets @review" do
          expect(assigns(:review)).to be_instance_of(Review)
        end

        it "does not create a new review" do
          expect(Review.count).to eq(0)
        end

        it "renders reviews#new" do
          expect(response).to render_template('new')
        end

        it "gives an error message" do
          expect(flash[:error]).to eq('There was a problem with your review.')
        end
      end      

      context "with valid inputs" do
        before { post :create, review: Fabricate.attributes_for(:review), business_id: business.id }

        it "creates a review" do
          expect(Review.count).to eq(1)
        end

        it "creates a review associated with the business" do
          expect(Review.first.business).to eq(business)         
        end

        it "creates a review associated with the user" do
          expect(Review.first.user).to eq(current_user)
        end

        it "redirects to business show page" do           
          expect(response).to redirect_to business
        end
        
        it "gives a success message" do
          expect(flash[:success]).to eq('Review has been created succesfully.')
        end

        it "sets @review" do
          expect(assigns(:review)).to be_instance_of(Review)
        end              
      end       
    end
  end
end