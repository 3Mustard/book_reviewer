class SessionsController < ActionController::Base

    def home 
    end

    def new 
    end 

    def create 
        @user = User.find_by(username: params[:username])
        
        if @user.try(:authenticate, (params[:user][:password])
            session[:user_id] = @user.id
            redirect_to @user  
        else 
            flash[:error] = "Sorry, login info was incorrect. Please try again."
            redirect_to login_path
        end
    end  

    def destroy 
        session.delete(:user_id) 
        redirect_to '/'
    end 
end