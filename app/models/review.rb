class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :book

    def current_users_review(book_id)
        book = Book.find(book_id)
        book.reviews.find_by(user_id: current_user.id)
    end 
end
