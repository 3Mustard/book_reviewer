class ApplicationController < ActionController::Base
    helper_method :current_user,

    def home 
    end 

    private 

    def current_user
        user = User.find(session[:user_id])
    end
end