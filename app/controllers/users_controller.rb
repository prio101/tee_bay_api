class UsersController < ApplicationController

  def authenticate
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: { data: "User has been authenticated" }, status: :ok
    else
      render json: { data: "User has not been authenticated" }, status: :unauthorized
    end
  end


  def create
    @user = User.new(user_params)
    if @user.save
      render json: { data: "User has been created" }, status: :created
    else
      render { data: "User has not been created" }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
