class UsersController < ApplicationController

    def welcome
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        redirect_to user_path(@user)
    end

    def show
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
    end

    def edit
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
    end

  
end
