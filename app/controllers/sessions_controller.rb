class SessionsController < ApplicationController

    def home 
        if user_signed_in?
            redirect_to books_path
        end 
    end

    def new
    end 

    def create 
        @user = User.find_by(username: params[:user][:username])
    
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to books_path
        else 
            flash[:error] = "Username and password do not match."
            render 'new'
        end
    end  

    def destroy 
        session.delete(:user_id)
        redirect_to '/'
    end 
end