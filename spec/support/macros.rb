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