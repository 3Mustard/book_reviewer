class User < ApplicationRecord
    has_secure_password
    has_many :reviews 
    has_many :reviewed_books, through: :reviews
    
    #validations
    validates :username, uniqueness: true, presence: true 

    #returns the users review for a given book
    def current_users_review(book_id)
        book = Book.find(book_id)
        book.reviews.find_by(user_id: current_user.id)
    end 
end
