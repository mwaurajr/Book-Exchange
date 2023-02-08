class SessionsController < ApplicationController

    skip_before_action :require_login, only: [:create]

    def create
      user = User.find_by(email: session_params[:email])
  
      if user&.authenticate(session_params[:password])
        jwt_token = JWT.encode(
          { user_id: user.id },
          Rails.application.credentials.secret_key_base,
          "HS256"
        )
        cookies["jwt_token"] = jwt_token
        render json: { jwt_token: jwt_token }
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end
  
    def destroy
      cookies.delete("jwt_token")
      head :no_content
    end
  
    private
  
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
