class LoginController < ApplicationController
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
  public
  
  def index
    if !session[:user_id].nil?
      redirect_to "/"
    end
  end
  
  # Log the user in and create a session
  def create
    user = User.find_by username: params[:user][:username]
    
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:user][:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.

      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:warning] = "Incorrect Username or Password"
      # If user's login doesn't work, send them back to the login form.
      redirect_to login_path
    end
  end
  
  #Destroy the session in the browser
  def logout
    session[:user_id] = nil
    redirect_to '/'
  end
end

    