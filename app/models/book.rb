class Book < ApplicationRecord
    belongs_to :author # author class has_many books and gets author.books book needs author_id in migrations
    has_many :reviews #book.reviews
    has_many :users, through: :reviews #book.users??

    ##validations 
    validates :title, uniqueness: true, presence: true 

    ##nested resources
    accepts_nested_attributes_for :author 

    def author_attributes=(author_attributes)
        if author_attributes[:name] != "" 
            self.build_author(name: author_attributes[:name])
        end 
    end 

    def self.recently_added
        order(created_at: :desc).limit(10)
    end 
end
