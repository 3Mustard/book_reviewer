class Author < ApplicationRecord
    has_many :books

    # def authors_first_and_last_name
    #     name = self.first_name + " " + self.last_name
    # end
end
