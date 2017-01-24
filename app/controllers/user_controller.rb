class UserController < ApplicationController

  skip_before_action :authenticate_request

  def create
    @user = User.new(user_params)
    if @user.save
      authenticate(user_params[:email], user_params[:password])
    else
      render json: @user.errors, status: :unprocessable_entity 
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end