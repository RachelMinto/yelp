shared_examples "requires_authenticated_user" do
  it "should redirect to root path" do
    clear_current_user
    action
    expect(response).to redirect_to root_path
  end

  it "should give an error message" do
    clear_current_user
    action    
    expect(flash[:error]).to eq("You must be logged in to do that.")
  end     
end