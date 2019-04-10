class EventsController < ApplicationController
  def create
    @event = Event.create(name:params[:name],
                          description:params[:description],
                          start_date:params[:start_date],
                          event_venue_id:params[:event_venue_id])
    respond_to do |format|
      format.json {
        render json:@event.to_json
      }
    end
  end

  def destroy
  end

  def update
  end

  def upcoming_events

  end
end
