class RegistrationsController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: { message: 'User registered successfully' }
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
