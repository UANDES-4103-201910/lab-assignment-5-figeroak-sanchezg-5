class TicketsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @ticket = Ticket.create(ticket_params)
    respond_to do |format|
      format.json {
        render json:@ticket.to_json
      }
    end
  end

  def destroy
    Ticket.destroy(params[:id])
    head 201
  end

  def update
    ticket = Ticket.find(params[:id])
    ticket.update!(ticket_params)
    respond_to do |format|
      format.json {
        render json:@ticket.to_json
      }
    end
  end

  def ticket_params
    params.require(:ticket).permit(:ticket_type_id, :order_id)
  end

  def index
    if params[:ticket_type_id]
      @tickets = Ticket.where(ticket_type_id:params[:ticket_type_id])
      respond_to do |format|
        format.json {
          render json:@tickets.to_json
        }
      end
    end
  end
end
