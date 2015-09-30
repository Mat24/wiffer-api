class ApplicationController < ActionController::API
  before_action :autenticar
  def autenticar
    @token = params[:token]
    if @token
      set_token = Token.where(token: @token).first
      if set_token and set_token.user
        @current_user = set_token.user
      else
        fail NotAuthenticatedError
      end
    else
      fail NotAuthenticatedError
    end
  end

  class NotAuthenticatedError < StandardError
  end

  rescue_from NotAuthenticatedError do
    render text: "ERROR, NO ESTA AUTENTICADO"
  end
end
