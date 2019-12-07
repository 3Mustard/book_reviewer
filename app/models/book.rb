class Book < ApplicationRecord
    belongs_to :author # author class has_many books and gets author.books book needs author_id in migrations
    has_many :reviews #book.reviews
    has_many :users, through: :reviews #book.users??

    #validations
    validates :title, uniqueness: true, presence: true 

    #nested resources
    accepts_nested_attributes_for :author 
end
