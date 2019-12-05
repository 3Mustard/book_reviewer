class Book < ApplicationRecord
    belongs_to :author # author class has_many books and gets author.books book needs author_id in migrations
    has_many :reviews #book.reviews
    has_many :users, through: :reviews #book.users??

    #validations
    validates :title, uniqueness: true, presence: true 

    def current_users_review(book_id)
        book = Book.find(book_id)
        book.reviews.find_by(user_id: current_user.id)
    end 
end
