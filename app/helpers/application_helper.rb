module ApplicationHelper
    
    def current_user
        user = User.find(session[:user_id])
    end 

    def current_users_books
        books = current_user.reviews.collect do |review|
            books << review.book
        end 
    end 

    
end
