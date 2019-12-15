module ApplicationHelper 

    def title(text)
        content_for :title, text
      end
      
    def index_link 
        link_to "<< back to index", books_path
    end 
end
