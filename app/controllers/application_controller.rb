require Rails.root.join("commands", "authorize_api_request")
require Rails.root.join("commands", "authenticate_user")

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.new(params[:email], params[:password]).call
    if command.success?
      render json: {auth_token: command.result}
    else
      render json: {error: command.errors}, status: :unauthorized
    end
  end

  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: {error: 'Not Authorized'}, status: 401 unless @current_user
  end
end
