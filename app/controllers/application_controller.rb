class ApplicationController < ActionController::API

  def authenticate
    @user = User.find_by(token: params[:token])

    return @user if @user

    render json: { data: "User has not been authenticated" }, status: :unauthorized
  end
end
