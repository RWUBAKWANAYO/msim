# app/lib/jwt_authentication.rb
module JwtAuthentication
    def generate_jwt_token(user)
    payload = { user_id: user.id }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end