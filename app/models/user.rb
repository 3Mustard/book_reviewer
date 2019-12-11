class User < ApplicationRecord
    has_secure_password
    has_many :reviews 
    has_many :books, through: :reviews
    
    #validations
    validates :username, uniqueness: true, presence: true  
    validates :email, uniqueness: true, presence: true 

    def total_reviews 
        self.books.count 
    end 

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex #generates a random number 
        end
    end 

end
