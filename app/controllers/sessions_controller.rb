class SessionsController < ActionController::Base

    def home 
    end

    def new 
    end 

    def create 
        binding.pry
        @user = User.find_by(username: params[:user][:username])
    
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to books_path
        else 
            flash[:error] = "Sorry, login info was incorrect. Please try again."
            redirect_to login_path
        end
    end  

    def destroy 
        session.delete(:user_id)
        redirect_to '/'
    end 

    private 

    def auth_hash
        request.env['omniauth.auth']
    end
end