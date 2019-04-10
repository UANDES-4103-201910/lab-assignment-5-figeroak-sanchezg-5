class UsersController < ApplicationController
  def create
    @user = User.create(name:params[:name],
                        lastname:params[:lastname])
    respond_to do |format|
      format.json {
        render json:@event_venue.to_json
      }
    end
  end

  def destroy
  end

  def update
  end

  def user_with_most_tickets

  end
end
