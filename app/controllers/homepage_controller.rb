class HomepageController < ApplicationController
  def index
    # Store all of the games from the model in an instance variable so the view can access them
    @games = Game.order("favorite_count DESC").limit(5)
    @events = Event.order("attending_count DESC").limit(3)
    
    @favorite_games
    @favorite_game_ids
    @favorite_events
    @favorite_event_ids
    
    # Check if the events are favorited and if the events are being attended
    if logged_in?
      @favorite_games = FavoriteGame.where("user_id = #{session[:user_id]}")
      @favorite_game_ids = @favorite_games.map{|game| game.game_id}
      @favorite_events = FavoriteEvent.where("user_id = #{session[:user_id]}")
      @favorite_event_ids = @favorite_events.map{|event| event.event_id}
    end
  end
end
