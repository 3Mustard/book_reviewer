module AuthorsHelper
    
    def authors_first_and_last_name(author)
        name = author.first_name + " " + author.last_name
    end
end
