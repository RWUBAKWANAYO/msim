class SessionsController < ApplicationController
  include ActionController::Cookies
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = generate_jwt_token(user)
      render json: { token: token}, status: :ok
    else
  end
  end

  end
end
