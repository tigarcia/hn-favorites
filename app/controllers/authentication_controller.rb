class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    super(params[:email], params[:password])
  end

end
