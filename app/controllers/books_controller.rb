class BooksController < ApplicationController
    
    def index
        
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

end
