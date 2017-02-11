require 'spec_helper'

feature "user creates a business review" do
  background do
    User.create(first_name: 'Alice', last_name: 'Munro', email: 'alice@hotmail.com', password: 'password')
  end

  scenario "user signs in, views a business, creates a review" do
    business1 = Fabricate(:business)
    business2 = Fabricate(:business)

    sign_in
    expect_success_message
    expect_business_index(business1.company_name)
    click_business_link(business2)
    expect_show_page_for(business2)
    click_create_review
    expect_review_form_associated_with(business2)
    submit_review
    expect_review_success_message
    expect_page_to_include_review(business2)
  end


  def expect_success_message
    page.should have_content("You have successfully logged in.")
  end

  def expect_business_index(name)
    page.should have_content(name)
  end

  def click_business_link(business2)
    click_link business2.company_name
  end

  def expect_show_page_for(business2)
    page.should have_content(business2.company_name)
    page.should have_content("Hours")    
  end

  def click_create_review
    click_link "Write a Review"
  end

  def expect_review_form_associated_with(business2)
    page.should have_content("Write a Review")
    page.should have_content(business2.company_name)                  
  end

  def submit_review
    choose 'review_rating_4'
    fill_in("Comment", with: 'It was okay.')
    click_button 'Submit'
  end

  def expect_review_success_message
    page.should have_content("Review has been created succesfully.")
  end

  def expect_page_to_include_review(business2)
    page.should have_content('It was okay') 
  end
end