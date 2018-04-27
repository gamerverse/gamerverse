require 'rails_helper'

RSpec.describe LoginController, type: :controller do

  describe "GET #index" do
    it "redirect to homepage if session != nil" do
      session[:user_id] = "test"
      get :index
      expect(response).to redirect_to("/")
    end
    
    it "redirect to login page if session == nil" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST #create" do
    it "user gets logged in" do
      user_params = {username: "test-user", email: "testemail@mail.com",
                              password: "testpass123", password_confirmation: "testpass123",
                              zipcode: "12345", bio: "hello world"}
                              
      test_user = double("test user", user_params)
      
      expect(User).to receive(:find_by).and_return(test_user)
      expect(test_user).to receive(:authenticate).and_return(true)
      expect(test_user).to receive(:id).and_return(1)
      
      post :create, params: {user: {username: "test-user",
                              password: "testpass123"}}
      
      expect(session[:user_id]).to eq(1)
      expect(response).to redirect_to("/")

    end
    
    it "user uses invalid credentials" do
      
      user_params = {username: "test-user", email: "testemail@mail.com",
                              password: "testpass123", password_confirmation: "testpass123",
                              zipcode: "12345", bio: "hello world"}
                              
      test_user = double "test2", user_params
      
      
      #expect(Foo).to receive(:find_by_name).and_return(foo)
      
      post :create, params: {user: {username: "test-user",
                              password: "wrongpass"}}

      expect(session[:user_id]).to eq(nil)
      expect(response).to redirect_to(login_path)
    end
  end
  
  describe "POST #logout" do
    
    it "redirect to homepage if session == nil" do
      post :logout
      expect(response).to redirect_to("/")
    end
    
    it "if session != nil, redirect to homepage and logout the user" do
      session[:user_id] = "test"
      post :logout
      expect(response).to redirect_to("/")
      expect(session[:user_id]).to eq(nil)
    end
  end

end
