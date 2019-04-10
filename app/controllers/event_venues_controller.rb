class EventVenuesController < ApplicationController
  def create
    @event_venue = EventVenue.create(name:params[:name], address:params[:address], capacity:params[:capacity])
    respond_to do |format|
      format.json {
        render json:@event_venue.to_json
      }
    end
  end

  def destroy
    EventVenue.destroy(params[:id])
    head 201
  end

  def update
    event_venue = EventVenue.find(params[:id])
    event_venue.update!()
    redirect_to event_venue
  end

  def event_venue_params
    params.require(:event_venue).permit(:name, :address, :capacity)
  end
end
