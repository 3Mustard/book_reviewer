class SessionsController < ApplicationController

    def home 
        if session[:user_id]
            redirect_to '/books'
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

    def omniauth 
        @user = User.create_by_google_omniauth(auth) 

        session[:user_id] = @user.id
        redirect_to books_path 
    end 

    def destroy 
        session.delete(:user_id)
        redirect_to '/'
    end 

    private 

    def auth
        request.env['omniauth.auth']
    end 
end