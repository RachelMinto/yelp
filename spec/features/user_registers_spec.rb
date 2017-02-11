require 'spec_helper'

feature "user registers" do
  scenario "with valid email and password" do
    visit root_path
    click_link 'Sign Up'
    page.should have_content('Sign Up for Yelp')
    register_new_user
    page.should have_content('Welcome, Sally')
  end

  def register_new_user
    fill_in("First Name", with: 'Sally')
    fill_in("Last Name", with: 'Smithson')
    fill_in("Home Town and State", with: 'Manitoba, WA')
    fill_in("Email", with: 'example1990@hotmail.com')
    fill_in("Password", with: 'password')
    click_button('Sign Up')
  end
end