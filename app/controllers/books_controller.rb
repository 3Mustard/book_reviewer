class BooksController < ApplicationController

    def index 
        if params[:search]
            @book = Book.find_by(title: params[:search])
        end 
    end 

    def show
        @book = Book.find(params[:id])
    end 

    def new 
    end 

    def create 
    end 

end
