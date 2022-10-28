class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        @user = User.find_by(username: username)

        if user
            login!(user)
            redirect_to users_url
        else 
            flash.now[:errors] = [@user.errors.full_messages]
            render :new
        end
    end

    def destroy
        logout!
        flash[:messages] = ["Successfully Logged Out"]
        redirect_to new_session_url
    end
end

value = <%= @user.username %>