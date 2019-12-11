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

    def self.create_with_omniauth(auth)
        create! do |user|
          user.provider = auth["provider"]
          user.uid = auth["uid"]
          user.name = auth["info"]["name"] #sets name, check params for auth value
        end
    end

end
