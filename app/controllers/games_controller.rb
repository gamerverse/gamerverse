class GamesController < ApplicationController
  def index
    # Store all of the games from the model in an instance variable so the view can access them
    @games = Game.all
    @favorite_games = FavoriteGame.where("user_id = #{session[:user_id]}")
  end
  
  def favorite
    p '----------------'
    p params
    type = params[:type]
    game = Game.find(params[:id])
    current_user = User.find(session[:user_id])
    if type == "favorite"
      favorite_game = FavoriteGame.new(user_id: current_user.id, game_id: game.id)
      favorite_game.save
      redirect_to games_path

    elsif type == "unfavorite"
      FavoriteGame.find(params[:id]).destroy
      redirect_to games_path

    else
      # Type missing, nothing happens
      redirect_to games_path
    end
  end
end
