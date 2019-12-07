class BooksController < ApplicationController

    def index 
        #handles a get request from the index view to return a book object by name
        if params[:search]
            @book = Book.try(:find_by, title: params[:search])
            @author = Author.try(:find_by, name: params[:search])
        end 
    end 

    def show
        @book = Book.find(params[:id])
        @review = @book.reviews.find_by(user_id: current_user.id)
    end 

    def new 
        @book = Book.new 
        @book.build_author
    end 

    def create 
        @book = Book.new(book_params)
        if @book.valid?
            @book.save
            redirect_to @book
        else 
            flash[:error] = "something went wrong"
            redirect_to books_path 
        end 
    end  

    private 
    
    def book_params 
        params.require(:book).permit(:title, :genre, :author_id, author_attributes: [:name])
    end 
end
