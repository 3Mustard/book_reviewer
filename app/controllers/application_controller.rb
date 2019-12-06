class ApplicationController < ActionController::Base
    helper_method :current_user, :authors_first_and_last_name 

    def home 
    end 

    private 

    def current_user
        user = User.find(session[:user_id])
    end

    def authors_first_and_last_name(author)
        name = author.first_name + " " + author.last_name
    end
end
