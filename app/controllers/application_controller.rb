class ApplicationController < ActionController::API
    private

  def current_user
    @current_user ||= User.find_by(id: jwt_user_id)
  end

  def jwt_user_id
    decoded_token&.first&.fetch("user_id")
  end

  def decoded_token
    JWT.decode(
      jwt_token,
      Rails.application.credentials.secret_key_base,
      true,
      { algorithm: "HS256" }
    )
  rescue JWT::DecodeError
    nil
  end

  def jwt_token
    request.headers["Authorization"]&.split(" ")&.last || cookies["jwt_token"]
  end
end
