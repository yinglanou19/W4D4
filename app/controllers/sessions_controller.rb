class SessionsController < ApplicationController

    # sign in
    def new 
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            login!(@user)
            redirect_to  user_url(@user)
        else
            flash.now[:errors] = "Invalid credentials!"
            render :new
        end
    end

    #sign out
    def destroy
        logout!
        redirect_to new_session_url
    end

    def show
        render json:"TEST", status:200
    end

end
