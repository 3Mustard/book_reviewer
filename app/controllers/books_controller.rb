class BooksController < ApplicationController

    def show 
        set_book
    end

    private 
    
    def set_book 
        @book = Book.find(params[:id])
    end 
end
