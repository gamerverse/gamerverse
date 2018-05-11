require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "PUT #favorite" do
    it "favorite returns redirect" do
      session[:user_id] = 1
      
      params = {
        id: 1, path: "/games", type: "favorite"
      }
      
      fake_game = double(id: 1, title: "Rocket League", coverart: "covers/rocket_league.jpg", favorite_count: 1, genre: "Sports")
      
      fake_user = double("fake user", {
        id: 1,
        username: "username",
        email: "username@gamerverse.com",
        zipcode: "11111",
        bio: "bio"
      })
      
      allow(Game).to(receive(:find).with("1").and_return(fake_game))
      allow(User).to(receive(:find).with(session[:user_id]).and_return(fake_user))

      put :favorite, {params: params}
      
      expect(response).to(redirect_to(games_path))
    end
    
    it "unfavorite returns redirect" do
      session[:user_id] = 1
      
      params = {
        id: 1, path: "/games", type: "unfavorite"
      }
      
      fake_game = double(id: 1, title: "Rocket League", coverart: "covers/rocket_league.jpg", favorite_count: 1 , genre: "Sports")
      
      fake_user = double("fake user", {
        id: 1,
        username: "username",
        email: "username@gamerverse.com",
        zipcode: "11111",
        bio: "bio"
      })
      
      allow(Game).to(receive(:find).with("1").and_return(fake_game))
      allow(User).to(receive(:find).with(session[:user_id]).and_return(fake_user))

      put :favorite, {params: params}
      
      expect(response).to(redirect_to(games_path))
    end
    
    it "redirects to / if no type" do
      session[:user_id] = 1
      
      params = {
        id: 1, path: "/games"
      }
      
      fake_game = double(id: 1, title: "Rocket League", coverart: "covers/rocket_league.jpg", favorite_count: 0, genre: "Sports")
      
      fake_user = double("fake user", {
        id: 1,
        username: "username",
        email: "username@gamerverse.com",
        zipcode: "11111",
        bio: "bio"
      })
      
      allow(Game).to(receive(:find).with("1").and_return(fake_game))
      allow(User).to(receive(:find).with(session[:user_id]).and_return(fake_user))

      put :favorite, {params: params}
      
      expect(response).to(redirect_to("/"))
    end
  end
  

end
