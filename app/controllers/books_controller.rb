class BooksController < ApplicationController
 
  before_action :set_user

  def index
    books = @user.books
    render json: books
  end


    def show
      book = Book.find(params[:id])
      if book 
        render json: book, status: :ok
      else 
        render json: { error: "Book not found" }, status: :not_found
    end

    def create(books_params)
      book = Book.create!(books_params)
      if book
        render json: book, status: :created
      else
        render json: {error: "Invalid Book"}, status: :unprocessable_entity

    end

    def update(books_params)
      book = Book.find(params[:id])
      render json: book.update!(book_params), status: :updated

    end

    def delete
      book = Book.find(params[:id])
      book.destroy
      head :no_content
    end 


    private

    def books_params
        params.require(:books).permit(:title, :description, :author)
    end
  
    def set_user
      @user = User.find(params[:user_id])
    end
end
