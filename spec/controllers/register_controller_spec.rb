require 'rails_helper'

RSpec.describe RegisterController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST #create" do
    context "Successful create" do
      it "successfully creates a valid user" do
        post :create, params: { user: {username: "test-user", email: "testemail@mail.com",
                              password: "testpass123", password_confirmation: "testpass123",
                              zipcode: "12345", bio: "hello world"}}
  
        expect(session[:user_id]).to eq(1)
        expect(response).to redirect_to '/'
      end
    end
    
    context "Empty fields" do
      it "fails if empty username" do
        post :create, params: { user: {email: "testemail@mail.com",
                              password: "testpass123", password_confirmation: "testpass123",
                              zipcode: "12345", bio: "hello world"}}
        
        expect(flash[:warning]).to include("Username can't be blank")
        expect(response).to redirect_to register_path
      end
      
      it "fails if empty password" do
        post :create, params: { user: {username: "test-user", email: "testemail@mail.com",
                              password_confirmation: "testpass123",
                              zipcode: "12345", bio: "hello world"}}
        
        expect(flash[:warning]).to include("Password can't be blank")
        expect(response).to redirect_to register_path
      end
      
      it "fails if empty email" do
        post :create, params: { user: {username: "test-user", password: "testpass123",
                              password_confirmation: "testpass123",
                              zipcode: "12345", bio: "hello world"}}
        
        expect(flash[:warning]).to include("Email can't be blank")
        expect(response).to redirect_to register_path
      end
      
      it "fails if empty zipcode" do
        post :create, params: { user: {username: "test-user", password: "testpass123",
                              email: "testemail@mail.com", password_confirmation: "testpass123",
                              bio: "hello world"}}
        
        expect(flash[:warning]).to include("Zipcode can't be blank")
        expect(response).to redirect_to register_path
      end
      
      it "fails if passwords don't match" do
        post :create, params: { user: {username: "test-user",  email: "testemail@mail.com",
                              password: "testpass123", password_confirmation: "testpass1234",
                              zipcode: "12345", bio: "hello world"}}
        
        expect(flash[:warning]).to include("Password confirmation doesn't match Password")
        expect(response).to redirect_to register_path
      end
    end
    
    context "Invalid fields" do
      it "fails if bad email address" do
        post :create, params: { user: {username: "test-user", email: "testemailmail.com",
                              password: "testpass123", password_confirmation: "testpass123",
                              zipcode: "12345", bio: "hello world"}}
        
        expect(flash[:warning]).to include("Email is invalid")
        expect(response).to redirect_to register_path
      end
      
      it "fails if short zipcode" do
        post :create, params: { user: {username: "test-user", email: "testemail@mail.com",
                              password: "testpass123", password_confirmation: "testpass123",
                              zipcode: "1234", bio: "hello world"}}
        
        expect(flash[:warning]).to include("Zipcode is too short (minimum is 5 characters)")
        expect(response).to redirect_to register_path
      end
      
      it "fails if long zipcode" do
        post :create, params: { user: {username: "test-user", email: "testemail@mail.com",
                              password: "testpass123", password_confirmation: "testpass123",
                              zipcode: "123456", bio: "hello world"}}
        
        expect(flash[:warning]).to include("Zipcode is too long (maximum is 5 characters)")
        expect(response).to redirect_to register_path
      end
      
      it "fails if invalid zipcode" do
        post :create, params: { user: {username: "test-user", email: "testemail@mail.com",
                              password: "testpass123", password_confirmation: "testpass123",
                              zipcode: "abcde", bio: "hello world"}}
        
        expect(flash[:warning]).to include("Zipcode is invalid")
        expect(response).to redirect_to register_path
      end
      
      it "fails if duplicate email" do
        post :create, params: { user: {username: "test-user", email: "testemail@mail.com",
                              password: "testpass123", password_confirmation: "testpass123",
                              zipcode: "12345", bio: "hello world"}}
        
        post :create, params: { user: {username: "test-user2", email: "testemail@mail.com",
                              password: "testpass123", password_confirmation: "testpass123",
                              zipcode: "12345", bio: "hello world"}}
        
        expect(flash[:warning]).to include("Email has already been taken")
        expect(response).to redirect_to register_path
      end
      it "fails if duplicate username" do
        post :create, params: { user: {username: "test-user", email: "testemail@mail.com",
                              password: "testpass123", password_confirmation: "testpass123",
                              zipcode: "12345", bio: "hello world"}}
                              
        post :create, params: { user: {username: "test-user", email: "testemail@mail11.com",
                              password: "testpass123", password_confirmation: "testpass123",
                              zipcode: "12345", bio: "hello world"}}
        
        expect(flash[:warning]).to include("Username has already been taken")
        expect(response).to redirect_to register_path
      end
    end
  end
end
