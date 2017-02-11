require 'spec_helper'

describe SessionsController do
  describe 'GET new' do
    it "sets @user" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end

    it "renders new if user is not logged in" do
      get :new
      expect(response).to render_template(:new)
    end

    it "redirects to root_path if user is logged in" do
      sign_in_user
      get :new       
      expect(response).to redirect_to root_path  
    end
  end

  describe 'POST create' do
    context "with invalid email" do
      before { post :create, email: 'wontwork@hotmail.com' }

      it "gives an error message" do
        expect(flash['danger']).to eq("There is something wrong with your username or password.")
      end

      it "renders new" do
        expect(response).to render_template :new
      end

      it "does not set the session[user_id]" do
        expect(session[:user_id]).to be_nil
      end
    end

    context "with incorrect password" do
      before do
        user = Fabricate(:user)
        post :create, :session => { email: user.email, password: user.password + '_wrong!' }
      end

      it "gives an error message" do
        expect(flash['danger']).to eq("There is something wrong with your username or password.")
      end

      it "renders new" do
        expect(response).to render_template :new
      end
    end

    context "with valid username and password" do
      let(:alice) { Fabricate(:user) }

      before do
        post :create, email: alice.email, password: alice.password
      end

      it "sets a session id" do
        expect(session[:user_id]).to eq(alice.id)
      end

      it "gives a success notice" do
        expect(flash['success']).to eq("You have successfully logged in.")
      end

      it "redirects to root_path" do
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'DELETE destroy' do
    context "with unauthenticated user" do
      it_behaves_like "requires_authenticated_user" do
        let(:action) { delete :destroy, id: 289 }
      end
    end

    context "user is logged in" do
      let(:alice) { Fabricate(:user) }

      before do
        session[:user_id] = alice.id        
        get :destroy, id: alice.id
      end

      it "sets user_id to nil" do
        expect(session[:user_id]).to be_nil
      end

      it "redirects to root_path" do
        expect(response).to redirect_to root_path
      end

      it "gives a successful logout notice" do
        expect(flash[:notice]).to eq("You are signed out.")
      end      
    end
  end
end