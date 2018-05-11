require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #create" do
    it "redirects to login page if not logged in" do
      session[:user_id] = nil
      
      get :create
      
      expect(response).to(redirect_to(login_path))
    end
  end
  
  describe "PUT #favorite" do
    it "attend returns redirect" do
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
    
    it "unattend returns redirect" do
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
        
        ActionController::Parameters.permit_all_parameters = true
        
        params = {
          event: {
            title: "Smash LAN Party", 
            location: "Smashville", 
            description: "LAN party for the best Smash players!",
            "date(1i)" => "2012",
            "date(2i)" => "11",
            "date(3i)" => "28"
          }
        }
        
        event_params = ActionController::Parameters.new({
          title: "Smash LAN Party", 
          location: "Smashville", 
          description: "LAN party for the best Smash players!"
        })
        
        fake_event = double("fake event")
        
        allow_any_instance_of(EventsController).to(receive(:event_params).and_return(event_params))
        allow(Event).to(receive(:new).with(event_params).and_return(fake_event))
        allow(fake_event).to(receive(:attending_count=).and_return(0))
        allow(fake_event).to(receive(:save).and_return(true))
        
        post :submit, {params: params}
        
        expect(response).to(redirect_to(events_path))
      end
      
      it "errors, doesn't create an event" do
        session[:user_id] = 1
        
        ActionController::Parameters.permit_all_parameters = true
        
        params = {
          event: {
            location: "Smashville", 
            description: "LAN party for the best Smash players!",
            "date(1i)" => "2012",
            "date(2i)" => "11",
            "date(3i)" => "28"
          }
        }
        
        event_params = ActionController::Parameters.new({
          location: "Smashville", 
          description: "LAN party for the best Smash players!"
        })
        
        fake_event = double("fake event")
        fake_receive_return = double("fake receive return")
        fake_full_messages = double("fake full messages")
        fake_uniq_messages = double("fake unique messages")
        
        allow_any_instance_of(EventsController).to(receive(:event_params).and_return(event_params))
        allow(Event).to(receive(:new).with(event_params).and_return(fake_event))
        allow(fake_event).to(receive(:attending_count=).and_return(0))
        allow(fake_event).to(receive(:save).and_return(false))
        allow(fake_event).to(receive(:errors)).and_return(fake_receive_return)
        allow(fake_receive_return).to(receive(:any?)).and_return(true)
        allow(fake_receive_return).to(receive(:full_messages)).and_return(fake_full_messages)
        allow(fake_full_messages).to(receive(:uniq)).and_return(fake_uniq_messages)
        
        post :submit, {params: params}
        
        expect(response).to(redirect_to(events_create_path))
      end
    end
  end
end
