require 'spec_helper'

describe BusinessesController do

  describe 'GET index' do
    it "sets @businesses" do
      business1 = Fabricate(:business)
      business2 = Fabricate(:business)
      get :index
      expect(assigns(:businesses)).to eq([business1, business2])
    end

    it "renders business#index view template" do
      get :index      
      expect(response).to render_template('index')
    end
  end

  describe 'GET new' do
    before { get :new }

    it "sets @business" do
      expect(assigns(:business)).to be_instance_of(Business)
    end

    it "renders the business#new template" do
      expect(response).to render_template('new')
    end
  end
end