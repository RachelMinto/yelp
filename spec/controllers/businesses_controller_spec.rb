require 'spec_helper'

describe BusinessesController do
  describe 'GET index' do
    it "sets @businesses" do
      expect(assigns(:businesses)).to eq(businesses)
    end
  end
end