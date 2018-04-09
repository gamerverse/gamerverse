class EventsController < ApplicationController
    def index
        # Store all of the events from the model in an instance variable so the view can access them
        @events = Event.all
    end
end
