class UsersController < ApplicationController
    
    def new 
        @user = User.new 
    end 

    def create 
        @user = User.new(user_params)
        if @user.valid?
            @user.save 
            redirect_to login_path
        else 
            render '/users/new'
        end 
    end 

    def show
    end 

    private 
    
    def user_params 
        params.require(:user).permit(:username, :password)
    end 
end