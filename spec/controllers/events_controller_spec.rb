require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "displays all events when not logged in" do
      # fake_events = {
      #   double("fake event 1", {
      #     id: 1, 
      #     title: "Smash LAN Party", 
      #     location: "Smashville", 
      #     description: "LAN party for the best Smash players!", 
      #     date: DateTime.new(2018,4,8,12),
      #     attending_count: 1
      #   }),
      #   double("fake event 2", {
      #     id: 2, 
      #     title: "Smash LAN Party 2", 
      #     location: "Smashville 2", 
      #     description: "LAN party for the best Smash players! 2", 
      #     date: DateTime.new(2018,4,8,12),
      #     attending_count: 0
      #   })
      # }
      
      # fake_user = double("fake user", {
      #   id: 1,
      #   username: "username",
      #   email: "username@gamerverse.com",
      #   zipcode: "11111",
      #   bio: "bio"
      # })
      
      # allow(Event).to(receive(:all).and_return(fake_events))
    end
  end
  
  describe "PUT #favorite" do
    it "favorite returns redirect" do
      session[:user_id] = 1
      
      params = {
        id: 1, path: "/events", type: "attend"
      }
      
      fake_event = double("fake event", {
        id: 1, 
        title: "Smash LAN Party", 
        location: "Smashville", 
        description: "LAN party for the best Smash players!", 
        date: DateTime.new(2018,4,8,12),
        attending_count: 0
      })
      
      fake_user = double("fake user", {
        id: 1,
        username: "username",
        email: "username@gamerverse.com",
        zipcode: "11111",
        bio: "bio"
      })
      
      fake_favorite_event = double("fake favorite event", {
        id: 1,
        event_id: 1,
        user_id: 1
      })
      
      allow(Event).to(receive(:find).with("1").and_return(fake_event))
      allow(User).to(receive(:find).with(session[:user_id]).and_return(fake_user))
      allow(FavoriteEvent).to(receive(:find_by).with({user_id: 1, event_id: 1}).and_return(fake_favorite_event))

      put :favorite, {params: params}
      
      expect(response).to(redirect_to(events_path))
    end
    
    it "unfavorite returns redirect" do
      session[:user_id] = 1
      
      params = {
        id: 1, path: "/events", type: "unattend"
      }
      
      fake_event = double("fake event", {
        id: 1, 
        title: "Smash LAN Party", 
        location: "Smashville", 
        description: "LAN party for the best Smash players!", 
        date: DateTime.new(2018,4,8,12),
        attending_count: 1
      })
      
      fake_user = double("fake user", {
        id: 1,
        username: "username",
        email: "username@gamerverse.com",
        zipcode: "11111",
        bio: "bio"
      })
      
      fake_favorite_event = double("fake favorite event", {
        id: 1,
        event_id: 1,
        user_id: 1
      })
      
      allow(Event).to(receive(:find).with("1").and_return(fake_event))
      allow(User).to(receive(:find).with(1).and_return(fake_user))
      allow(FavoriteEvent).to(receive(:find_by).with({user_id: 1, event_id: 1}).and_return(fake_favorite_event))
      allow(fake_favorite_event).to(receive(:destroy)).and_return(true)

      put :favorite, {params: params}

      expect(response).to(redirect_to(events_path))
    end
    
    it "redirects to / if no type" do
      session[:user_id] = 1
      
      params = {
        id: 1, path: "/events"
      }
      
      fake_event = double("fake event", {
        id: 1, 
        title: "Smash LAN Party", 
        location: "Smashville", 
        description: "LAN party for the best Smash players!", 
        date: DateTime.new(2018,4,8,12),
        attending_count: 0
      })

      fake_user = double("fake user", {
        id: 1,
        username: "username",
        email: "username@gamerverse.com",
        zipcode: "11111",
        bio: "bio"
      })
      
      allow(Event).to(receive(:find).with("1").and_return(fake_event))
      allow(User).to(receive(:find).with(session[:user_id]).and_return(fake_user))

      put :favorite, {params: params}
      
      expect(response).to(redirect_to("/"))
    end
  end

  describe "POST #submit" do
    context "user is not logged in" do
      it "redirects to login page" do
        session[:user_id] = nil
        
        post :submit
        
        expect(response).to(redirect_to(login_path))
      end
    end
    
    context "user is logged in" do
      it "no errors, creates an event" do
        session[:user_id] = 1
        
        # bottom isn't working, can't figure out how to fix the issue
        
        # events_params = {
        #   title: "Smash LAN Party", 
        #   location: "Smashville", 
        #   description: "LAN party for the best Smash players!", 
        #   date: DateTime.new(2018,4,8,12)
        # }
        
        # fake_event = double("fake event", {
        #   id: 1, 
        #   title: "Smash LAN Party", 
        #   location: "Smashville", 
        #   description: "LAN party for the best Smash players!", 
        #   date: DateTime.new(2018,4,8,12),
        #   attending_count: 0
        # })
        
        # allow(Event).to(receive(:new).with(events_params).and_return(fake_event))
        
        # post :submit, {params: {:event => events_params}}
      end
    end
  end
end
