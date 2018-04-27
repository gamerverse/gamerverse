class EventsController < ApplicationController
    private
    
    def event_params
      params.require(:event).permit(:title, :date, :location, :description)
    end
    
    public
    
    # Display the events page
    def index
      # Store all of the events from the model in an instance variable so the view can access them
      @events = Event.all
    end
    
    # Display the create events page
    def create
      if (session[:user_id] == nil)
        redirect_to login_path
      end
    end
    
    # Submit the info to be create the event
    def submit
      if (session[:user_id] != nil)
        # https://stackoverflow.com/a/13606990
        event = params[:event]
        event_params[:date] = Date.new event["date(1i)"].to_i, event["date(2i)"].to_i, event["date(3i)"].to_i
        
        event = Event.new(event_params)
    
        # Check if the validations are successful and reutrn false if they're not
        # If validations fail, abort and do not save
        # http://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-save
        if event.save
          redirect_to events_path
        else
          # If there are any errors, set the flash warning to include the array of error messages
          if event.errors.any?
            flash[:warning] = event.errors.full_messages.uniq
            
            redirect_to events_create_path
          end
        end
      else
        redirect_to login_path
      end
    end
end
