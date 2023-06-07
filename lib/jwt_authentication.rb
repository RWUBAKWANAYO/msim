# app/lib/jwt_authentication.rb
module JwtAuthentication
  def jwt_authentication
    jwt_payload = decode_jwt_token
    User.find(jwt_payload['user_id'])
  rescue ActiveRecord::RecordNotFound
    nil
  end

  private

  def decode_jwt_token
    token = extract_jwt_token
    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)
    decoded_token.first
  rescue JWT::DecodeError => e
    Rails.logger.error("Failed to decode JWT token: #{e.message}")
    nil
  end

  def extract_jwt_token
    authorization_header = request.headers['Authorization']
    token = authorization_header.split.last if authorization_header.present?
    token
  end

  def generate_jwt_token(user)
    payload = { user_id: user.id }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
