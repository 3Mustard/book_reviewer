class SearchesController < ApplicationController
    def books
        @book_query = Book.search_by_name(params[:search])
        render 'books/index'
    end 
end
