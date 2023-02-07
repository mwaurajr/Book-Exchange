class BooksController < ApplicationController
    
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

    def BooksParams
        params.permit(:title, :description, :author, :published)
end
