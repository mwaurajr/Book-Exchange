class UsersController < ApplicationController

    def index
    end

    def show
    end

    def create
    end

    def update
    end

    def delete
    end 

    private

    def UsersParams
        params.permit(:name, :email, :password, :phoneNumber, :address,:bio, :profile_pic)
    end
end
