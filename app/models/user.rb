class User < ApplicationRecord
    has_secure_password
    has_many :reviews 
    has_many :reviewed_books, through: :reviews
    
    #validations
    validates :username, uniqueness: true, presence: true  

    #create a method so calling user.books shows all the books they have reviewed
    def books 
        books = [] 
        self.reviews.each do |review|
             books << review.book 
        end
        books  
    end 
end
