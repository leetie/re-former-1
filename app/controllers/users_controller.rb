class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    def new
    end

    def create
         @user = User.new(user_params)

        if @user.save
            redirect_to new_user_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to edit_user_path
        else
            render :edit
        end
    end

    def show
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
