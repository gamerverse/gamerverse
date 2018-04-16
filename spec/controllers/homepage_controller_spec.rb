require 'rails_helper'

RSpec.describe HomepageController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    # it "limits the number of games" do
    #   @game1 = Game.create!({ title: "game1", coverart: "game1" })
    #   @game2 = Game.create!({ title: "game2", coverart: "game2" })
    #   @game3 = Game.create!({ title: "game3", coverart: "game3" })
    #   @game4 = Game.create!({ title: "game4", coverart: "game4" })
    #   @game5 = Game.create!({ title: "game5", coverart: "game5" })

    #   get :index

    #   p response.body
      
    #   expect(response.body).to have_css('li.game-list-item')
    #   #expect(response.body).to have_selector('#main', count: 1)
    #   #response.body.to have_css("li.game-list-item", :count => 5)
    # end
  end

end
