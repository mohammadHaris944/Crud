class UsersController < ApplicationController
    before_action :set_user, only: [:edit,:update]
    def new
    end
    def edit
    end
    def update
        if(@user.update(user_params))
            flash[:notice]="User updated successfully"
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def create
        @user=User.new(user_params)
        if(@user.save)
            flash[:notice]=" Welcome #{@user.username} You have successfully Sign Up"
            redirect_to articles_path
        else
            render 'new'
        end
    end
    private
    def user_params
        params.require(:user).permit(:username,:email,:password)

    end
    def set_user
        @user=User.find(params[:id])
    end
end