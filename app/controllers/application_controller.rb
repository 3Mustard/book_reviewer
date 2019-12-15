class ApplicationController < ActionController::Base
    helper_method :current_user, :user_signed_in?, :authenticate

    private 

    def current_user
        user = User.find(session[:user_id])
    end

    def authenticate
        redirect_to :login unless user_signed_in?
    end
    
    def user_signed_in?
        # converts current_user to a boolean by negating the negation
        !!current_user
    end
end