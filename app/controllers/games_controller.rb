class GamesController < ApplicationController
  def index
    # Store all of the games from the model in an instance variable so the view can access them
    @games = Game.all
    @favorite_games
    @favorite_game_ids
    if(logged_in?)
      @favorite_games = FavoriteGame.where("user_id = #{session[:user_id]}")
      @favorite_game_ids = @favorite_games.map{|game| game.game_id}
    end

  end
  
  def favorite
    type = params[:type]
    game = Game.find(params[:id])
    current_user = User.find(session[:user_id])
    
    if type == "favorite"
      favorite_game = FavoriteGame.new(user_id: current_user.id, game_id: game.id)
      favorite_game.save
      redirect_to params[:path]

    elsif type == "unfavorite"
      FavoriteGame.find_by(user_id: current_user.id, game_id: game.id).destroy
        
      redirect_to params[:path]
    else
      # Type missing, nothing happens
      redirect_to "/"
    end
  end
end
