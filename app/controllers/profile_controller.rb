class ProfileController < ApplicationController
  # Display the profile page
  def index
    # Store all of the favorited games from the model in an instance variable so the view can access them
    @favorite_games = FavoriteGame.where("user_id = #{session[:user_id]}").joins(:game).select(:title, :coverart)
    
    if (session[:user_id] != nil)
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to login_path
    end
  end
  
  # Display the edit profile page
  def edit
    if (session[:user_id] != nil)
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to login_path
    end
  end
  
  # Submit changes to a user's profile
  def submit
    if(session[:user_id] != nil)
      user = User.find_by_id(session[:user_id])
      
      user.update({
        email: params[:user][:email],
        zipcode: params[:user][:zipcode],
        bio: params[:user][:bio]
      })
      
      if user.errors.any?
        flash[:warning] = user.errors.full_messages.uniq
        redirect_to profile_edit_path and return
      else
        user.save!
      end
      
      redirect_to profile_path
    else
      redirect_to login_path
    end
  end
end
