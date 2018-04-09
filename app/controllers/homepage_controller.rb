class HomepageController < ApplicationController
  def index
    # Store all of the games from the model in an instance variable so the view can access them
    @games = Game.limit(5)
    @events = Event.limit(3)
  end
end
