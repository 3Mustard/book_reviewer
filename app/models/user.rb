class User < ApplicationRecord
    has_secure_password
    has_many :reviews 
    has_many :books, through: :reviews
    
    #validations
    validates :username, uniqueness: true, presence: true  
end
