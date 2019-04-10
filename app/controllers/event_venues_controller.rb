class EventVenuesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @event_venue = EventVenue.create(event_venue_params)
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
    @event_venue = EventVenue.find(params[:id])
    @event_venue.update!(event_venue_params)
    respond_to do |format|
      format.json {
        render json:@event_venue.to_json
      }
    end
  end

  def event_venue_params
    params.require(:event_venue).permit(:name, :address, :capacity)
  end
end
