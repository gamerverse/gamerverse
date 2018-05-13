require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
  describe "GET #index" do
    it "displays all games and events when not logged in" do
      session[:user_id] = nil
      
      fake_game = double("fake game", {
        id: 1,
        title: "Rocket League",
        coverart: "covers/rocket_league.jpg",
        favorite_count: 1,
        genre: "Sports"
      })
      
      fake_event = double("fake event", {
        id: 1, 
        title: "Smash LAN Party", 
        location: "Smashville", 
        description: "LAN party for the best Smash players!", 
        date: DateTime.new(2018,4,8,12),
        attending_count: 0
      })
      
      fake_order_return = double("fake order return")
      
      allow(Game).to(receive(:order).with("favorite_count DESC").and_return(fake_order_return))
      allow(fake_order_return).to(receive(:limit).with(5)).and_return(fake_game)
      
      allow(Event).to(receive(:order).with("attending_count DESC").and_return(fake_order_return))
      allow(fake_order_return).to(receive(:limit).with(3)).and_return(fake_event)
      
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "displays all favorite games and events when logged in" do
      session[:user_id] = 1
      
      fake_game = double("fake game", {
        id: 1,
        title: "Rocket League",
        coverart: "covers/rocket_league.jpg",
        favorite_count: 1,
        genre: "Sports"
      })
      
      fake_event = double("fake event", {
        id: 1, 
        title: "Smash LAN Party", 
        location: "Smashville", 
        description: "LAN party for the best Smash players!", 
        date: DateTime.new(2018,4,8,12),
        attending_count: 0
      })
      
      fake_order_return = double("fake order return")
      fake_favorite_games = double("fake favorite games")
      fake_favorite_game_ids = double("fake favorite game ids")
      fake_favorite_events = double("fake favorite events")
      fake_favorite_event_ids = double("fake favorite event ids")
      
      allow(Game).to(receive(:order).with("favorite_count DESC").and_return(fake_order_return))
      allow(fake_order_return).to(receive(:limit).with(5)).and_return(fake_game)
      
      allow(Event).to(receive(:order).with("attending_count DESC").and_return(fake_order_return))
      allow(fake_order_return).to(receive(:limit).with(3)).and_return(fake_event)
      
      allow(FavoriteGame).to(receive(:where).with("user_id = 1")).and_return(fake_favorite_games)
      allow(fake_favorite_games).to(receive(:map)).and_return(fake_favorite_game_ids)
      
      allow(FavoriteEvent).to(receive(:where).with("user_id = 1")).and_return(fake_favorite_events)
      allow(fake_favorite_events).to(receive(:map)).and_return(fake_favorite_event_ids)
      
      get :index
      
      expect(response).to have_http_status(:success)
    end
  end
end
