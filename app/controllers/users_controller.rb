class UsersController < ApplicationController
    
    def new 
        @user = User.new 
    end 

    def create 
        @user = User.new(user_params)
        if @user.valid?
            @user.save 
            session[:user_id] = @user.id 
            redirect_to books_path
        else 
            render :new 
        end 
    end 

    def show
        current_user
    end 

    private 

    def current_user 
        @user = User.find(params[:id])
    end 

    def user_params 
        params.require(:user).permit(:username, :password)
    end 
end