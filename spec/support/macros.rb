def clear_current_user
  session[:user_id] = nil
end

def current_user
  User.find(session[:user_id])
end

def sign_in_user
  alice = Fabricate(:user)
  session[:user_id] = alice.id
end

def sign_in(a_user=nil)
  user = a_user || Fabricate(:user)
  visit login_path
  fill_in("Email", with: user.email)
  fill_in("Password", with: user.password)
  click_button('Sign In')
end