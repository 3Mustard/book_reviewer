class Book < ApplicationRecord
    belongs_to :author # author class has_many books and gets author.books book needs author_id in migrations
    has_many :reviews #book.reviews
    has_many :users, through: :reviews #book.users??

    #validations
    validates :title, uniqueness: true, presence: true 

    #returns the users review for the book calling this method 
    def current_users_review(user_id)
        self.reviews.find_by(user_id: user_id)
    end
end
