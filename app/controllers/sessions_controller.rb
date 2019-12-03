class SessionsController < ActionController::Base

    def home 
    end 

    def new
        @user = User.new  
    end 

    def create 
        @user = User.find_by(username: params[:username])

    end 

    def destroy 
        
    end 
end