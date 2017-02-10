require 'spec_helper'

describe User do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :location }
  it { should ensure_length_of(:password).is_at_least(8).on(:create) }

  context "#last_initial" do
    it "should return first letter of user's last name followed by period" do
      user = Fabricate(:user, last_name: 'Marcus')
      expect(user.last_initial).to eq('M.')
    end
  end     
end