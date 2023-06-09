class SessionsController < ApplicationController
  include ActionController::Cookies
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = generate_jwt_token(user)
      render json: { token: token}, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    request.headers['Authorization'].split[1]
    user = jwt_authentication

 end
  end
end
