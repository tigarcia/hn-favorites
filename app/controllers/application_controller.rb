require Rails.root.join("commands", "authorize_api_request")

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :authenticate_request

  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    @current_user = User.find(1)
    render json: {error: 'Not Authorized'}, status: 401 unless @current_user
  end
end
