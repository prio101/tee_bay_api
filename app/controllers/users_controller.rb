class UsersController < ApplicationController

  def authenticate
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      token = user.generate_token
      render json: { data: "User has been authenticated", token: token }, status: :ok
    else
      render json: { data: "User has not been authenticated" }, status: :unauthorized
    end
  end


  def create
    @user = User.new(user_params)
    if @user.save
      token = @user.generate_token
      render json: { data: "User has been created", token: token }, status: :created
    else
      render { data: "User has not been created" }, status: :unprocessable_entity
    end
  end

  def logout
    @user = User.find_by(token: params[:token])
    if @user
      @user.update(token: nil)
      render json: { data: "User has been logged out" }, status: :ok
    else
      render json: { data: "User has not been logged out" }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
