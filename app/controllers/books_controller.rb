class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.books
  end

    def show
    end

    def create(books_params)
    end

    def update(books_params)
    end

    def delete
    end 


    private

    def books_params
        params.require(:books).permit(:title, :description, :author, :published)
    end

    def require_login
        head :unauthorized unless current_user
      end

end
