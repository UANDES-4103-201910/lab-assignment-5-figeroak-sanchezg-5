class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @user = User.create(user_params)
    respond_to do |format|
      format.json {
        render json:@user.to_json
      }
    end
  end

  def destroy
    User.destroy(params[:id])
    head 201
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    respond_to do |format|
      format.json {
        render json:@user.to_json
      }
    end
  end

  def user_params
    params.require(:user).permit(:name, :lastname, :email, :password, :address)
  end

  def user_with_most_tickets
    users = User.all
    max_count_tickets = 0
    user_with_most_tickets = nil
    for user in users do
      orders = Order.where(user_id:user.id)
      count_tickets = 0
      for order in orders do
        count_tickets += Ticket.where(order_id:order.id).count
      end
      if max_count_tickets < count_tickets
        max_count_tickets = count_tickets
        user_with_most_tickets = user
      end
    end
    user_with_most_tickets
  end
end
