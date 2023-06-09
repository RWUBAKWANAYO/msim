class SessionsController < ApplicationController
  include ActionController::Cookies
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])

  end
  end

  end
end
