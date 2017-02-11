require 'spec_helper'

feature "user registers" do
  scenario "with valid email and password" do
    visit root_path
    click_sign_up_link
    expect_sign_up_form
    register_new_user
    expect_welcome_message
  end

  def click_sign_up_link
    click_link 'Sign Up'
  end

  def expect_sign_up_form
    page.should have_content('Sign Up for Yelp')
  end

  def register_new_user
    fill_in("First Name", with: 'Sally')
    fill_in("Last Name", with: 'Smithson')
    fill_in("Home Town and State", with: 'Manitoba, WA')
    fill_in("Email", with: 'example1990@hotmail.com')
    fill_in("Password", with: 'password')
    click_button('Sign Up')
  end 

  def expect_welcome_message
    page.should have_content('Welcome, Sally')
  end
end