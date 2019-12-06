class ApplicationController < ActionController::Base
    helper_method :current_user, :authors_first_and_last_name 

    def home 
    end 

    private 

    def current_user
        user = User.find(session[:user_id])
    end
end