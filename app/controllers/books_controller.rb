class BooksController < ApplicationController

    def index 
        
    end 

    def new
        @book = Book.new 
        @book.build_review  
    end 

    def create 
        @book = Book.new(book_params)

        if @book.valid? 
            @book.save 
            redirect_to book_review_path(@book)
        else 
            render :new 
        end 
    end 

    def show 
        current_book
    end 

    def edit
        current_book 
    end 

    def update
        current_book
        if @book.update(book_params)
            redirect_to @book
        else 
            render :edit 
        end 
    end 

    private 

    def current_book 
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:rating, :content, review_attributes: [:rating,:content])
    end 

end
