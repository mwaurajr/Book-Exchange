class UsersController < ApplicationController
    # skip_before_action :authenticate_user! only: [:create]

  
  def index
      users = User.all
      render json: users
  end


  def create
      user = User.new(user_params)

      if user.save
          token = issue_token(user)
          render json: {user: UserSerializer.new(user), jwt: token}
        else
            render json: { error: user.errors.full_messages.join(', ') }
          end
  end

  def show
      user = User.find(params[:id])
      if user
          render json: user
      else
          render json: {error: "User could not be found."}
      end
  end

  private

  def user_params
      params.require(:user).permit(:name, :age, :email, :password, :phoneNumber, :address, :bio)
  end
end



