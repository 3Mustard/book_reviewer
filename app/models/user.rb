class User < ApplicationRecord
    has_many :comments 
    has_many :reviews 
    has_many :reviewed_books, through: :reviews
end
