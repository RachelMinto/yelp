require 'spec_helper'

describe UsersController do
  describe 'GET new' do
    it "should set @user" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe 'POST create' do
    context "with valid inputs" do
      before { post :create, user: Fabricate.attributes_for(:user, first_name: 'Alice') }

      it "sets @user" do
        expect(assigns(:user)).to be_instance_of(User)
      end

      it "creates a new user" do
        expect(User.count).to eq(1)
      end

      it "redirects to user#new" do
        expect(response).to redirect_to(root_path)
      end

      it "sets a session id" do
        expect(session[:user_id]).to_not be_nil
      end      

      it "gives a success message" do
        expect(flash[:success]).to eq('Welcome, Alice')
      end
    end

    context "with invalid inputs" do
      before { post :create, { :user => { first_name: 'Alice' } } }

      it "sets @user" do
        expect(assigns(:user)).to be_instance_of(User)        
      end

      it "does not create a new user" do
        expect(User.count).to eq(0)        
      end

      it "renders user#new" do
        expect(response).to render_template('new')    
      end
    end
  end

  describe "GET show" do
    it "sets @user" do
      user = Fabricate(:user)
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end
end