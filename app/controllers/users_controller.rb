class UsersController < ApplicationController
  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :zipcode, :bio)
  end
  
  public
  # Registration page
  def register
    # TODO: Uncomment this out after we implement log-out
    # If the user is logged in, redirect them to the home page
    # if !session[:user_id].nil?
    #   redirect_to "/"
    # end
  end

  # When the user clicks submit on the registration page
  def create
    @user = User.new(user_params)
    
    # If the model is new, put it in the database; otherwise, update the existing model
    # Also check if the validations are successful and reutrn false if they're not
    # If validations fail, abort and do not save
    # http://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-save
    if @user.save
      session[:user_id] = @user.id
      
      # TODO: Update me to profile page
      redirect_to '/'
    else
      # If there are any errors, set the flash warning to include the array of error messages
      if @user.errors.any?
        flash[:warning] = @user.errors.full_messages.uniq
        
        redirect_to users_register_path
      end
    end
  end
end
