class GamesController < ApplicationController
  def index
    
    @games = {}
    @ordered_games = Game.all.order("favorite_count DESC")
    @ordered_games.each do |game|
      if(@games[game.genre])
        @games[game.genre].push(game)
      else
        @games[game.genre] = [game]
      end
    end
    
    @sorted_keys = @games.keys.sort
    
    # Store all of the games from the model in an instance variable so the view can access them
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
      Game.increment_counter(:favorite_count, game.id)
      redirect_to params[:path]

    elsif type == "unfavorite"
      favoriteEntry = FavoriteGame.find_by(user_id: current_user.id, game_id: game.id)
      if(favoriteEntry != nil)
        favoriteEntry.destroy
      end
      
      if(game.favorite_count > 0)
        Game.decrement_counter(:favorite_count, game.id)
      end
      redirect_to params[:path]
    else
      # Type missing, nothing happens
      redirect_to "/"
    end
  end
end
