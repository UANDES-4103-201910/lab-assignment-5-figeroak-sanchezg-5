class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @event = Event.create(event_params)
    respond_to do |format|
      format.json {
        render json:@event.to_json
      }
    end
  end

  def update
    @event = EventVenue.find(params[:id])
    @event.update!(event_params)
    respond_to do |format|
      format.json {
        render json:@event.to_json
      }
    end
  end

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :event_venue_id)
  end

  def upcoming_events
    @upcoming_events = Event.where(:start_date => Date.today..Date.today+3.month)
    respond_to do |format|
      format.json {
        render json:@upcoming_events.to_json
      }
    end
  end
end
