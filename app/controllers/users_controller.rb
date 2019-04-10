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
end
