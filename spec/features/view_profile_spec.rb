require 'spec_helper'

feature "user creates a business review" do
  background do
    User.create(first_name: 'Alice', last_name: 'Munro', email: 'alice@hotmail.com', password: 'password')
  end

  scenario "user views another user's profile page" do
    business = Fabricate(:business)
    other_user = Fabricate(:user)
    review = Fabricate(:review, user_id: other_user.id, business_id: business.id)

    sign_in
    click_business_link(business)
    click_profile_link(other_user)
    expect_other_profile_to_include(review)       
  end

  def click_business_link(business)
    click_link business.company_name
  end

  def click_profile_link(user)
    click_link user.first_name_with_last_initial
  end

  def expect_other_profile_to_include(review)
    page.should have_content(review.comment)
  end
end