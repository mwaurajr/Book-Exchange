class ApplicationController < ActionController::API
    def jwt_key
      Rails.application.credentials.jwt_key
    end
  
    def issue_token(user)
      exp = 5.days.from_now.to_i
      payload = { user_id: user.id, exp: exp }
      JWT.encode(payload, jwt_key, "HS256")
    end
  
    def decoded_token
      begin
        JWT.decode(token, jwt_key, true, { :algorithm => 'HS256' })
      rescue => exception
        [{ error: "Invalid Token" }]
      end    
    end
  
    def token
      request.headers["Authorization"]
    end
  
    def user_id
      decoded_token.first["user_id"]
    end
  
    def current_user
      user ||= User.find_by(id: user_id)
    end
  
    def logged_in?
      !!current_user
    end
  
    def authenticate_user!
      token, _options = token_and_options(request)
      user_id = AuthenticationTokenService.decode(token)
      @current_user = User.find(user_id)
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
  