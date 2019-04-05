class UsersController < ApplicationController

    def new # sign up page
        @user = User.new    #create nil user instance, helped set up partial
        render :new
    end
    def index
    end

    def show    # show one user infomation
        # @user = User.find(params[:id])   
        render :show
    end

    def create   # sign up
        @user = User.new(user_params)
        if @user.save  
            login!(@user)      # log user in
            redirect_to user_url(@user)    # redirect to :show
        else    # didn't successfully create user instance
                # flash error, redirect
        flash.now[:errors] = @user.errors.full_messages
        render :new
        end
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end

end
