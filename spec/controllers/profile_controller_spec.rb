require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

  describe "GET #index" do
    it "should render the profile page if the user is logged in" do
      session[:user_id] = 1

      get :index
      
      expect(response).to have_http_status(:success)
    end
    
    it "should redirect to the log in page if the user is not logged in" do
      session[:user_id] = nil

      get :index
      
      expect(response).to redirect_to(login_path)
    end
  end

  describe "GET #edit" do
    it "should render the edit profile page if the user is logged in" do
      session[:user_id] = 1
      
      get :edit
      
      expect(response).to(have_http_status(:success))
    end
    
    it "should redirect to the log in page if the user is not logged in" do
      session[:user_id] = nil
      
      get :edit
      
      expect(response).to(redirect_to(login_path))
    end
  end
  
  describe "POST #submit" do
    it "should make edits to a user if the user is logged in" do
      session[:user_id] = 1
      
      fake_user = double({
        username: "username",
        email: "username@gamerverse.com",
        zipcode: "11111",
        bio: "bio"
      })
      
      params = {
        user: {
          email: "test@example.com",
          zipcode: "12345",
          bio: "new bio"
        }
      }
      
      post :submit, {params: params}
      
      expect(User).to(receive(:find_by_id).with(session[:user_id]).and_return(fake_user))
      expect(fake_user).to(receive(:update))
      expect(response).to(redirect_to(profile_path))
    end
    
    it "should redirect to the log in page if the user is not logged in" do
      session[:user_id] = nil
      
      test_user = {
        user: {
          email: "username@gamerverse.com",
          zipcode: "11111",
          bio: "test bio"
        }
      }
      
      post :submit, params: test_user
      
      expect(response).to(redirect_to(login_path))
    end
  end
  
end
