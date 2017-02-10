require 'spec_helper'

describe BusinessesController do

  describe 'GET index' do
    it "sets @businesses" do
      business1 = Fabricate(:business)
      business2 = Fabricate(:business)
      get :index
      expect(assigns(:businesses)).to eq([business1, business2])
    end
  end

  describe 'GET new' do
    before { get :new }

    it "sets @business" do
      expect(assigns(:business)).to be_instance_of(Business)
    end
  end

  describe 'POST create' do
    context "with valid inputs" do
      before { post :create, { :business => Fabricate.attributes_for(:business) } }

      it "redirects to businesses#index" do
        expect(response).to redirect_to businesses_path
      end

      it "creates a new business" do
        expect(Business.count).to eq(1)        
      end

      it "sets @business" do
        expect(assigns(:business)).to be_instance_of(Business)
      end      
    end

    context "with invalid inputs" do
      before { post :create, { :business => { company_name: 'Kitchen Aid'} } }

      it "sets @business" do
        expect(assigns(:business)).to be_instance_of(Business)
      end

      it "renders businesses#new" do
        expect(response).to render_template('new')
      end

      it "does not create a new business" do
        expect(Business.count).to eq(0)        
      end
    end
  end
end