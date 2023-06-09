class SessionsController < ApplicationController
  include ActionController::Cookies
  def create
    user = User.find_by(email: params[:email])


  end
  end

  end
end
