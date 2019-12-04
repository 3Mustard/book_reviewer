class SessionsController < ActionController::Base

    def home 
    end

    def new 
    end 

    def create 
        #binding.pry
        @user = User.find_by(username: params[:user][:username])
        #raise @user.inspect
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to reviews_path
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