class ApplicationController < ActionController::Base
    helper_method :current_user 
    helper_method :my_book

    def home 
    end 

    private 

    def current_user
        user = User.find(session[:user_id])
    end

    #get book by reviews book_id
    def my_book(book_id)
        Book.find(book_id)
    end 
end
