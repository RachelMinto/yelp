require 'spec_helper'

describe UsersController do
  describe 'GET new' do
    it "should set @user" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end
end