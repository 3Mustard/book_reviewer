class SessionsController < ActionController::Base

    def home 
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

    private 

    # def auth_hash
    #     request.env['omniauth.auth']
    # end
end