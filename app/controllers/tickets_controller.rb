class TicketsController < ApplicationController
  def create
    @ticket = Ticket.create(ticket_type_id:params[:ticket_type_id],
                            order_id:params[:order_id])
    respond_to do |format|
      format.json {
        render json:@ticket.to_json
      }
    end
  end

  def destroy
  end

  def update
  end
end
