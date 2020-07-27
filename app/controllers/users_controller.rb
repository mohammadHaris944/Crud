class UsersController < ApplicationController
    before_action :set_user, only: [:edit,:update,:show,:destroy]
    before_action :require_user, except: [:show,:index]
    before_action :require_same_user, only: [:destroy ,:edit,:update]



    
    def new
        @user=User.new
    end
    def destroy
        @user.destroy
        session[:user_id]=nil
        flash[:notice]="Account and his associated articles are successfully deleted"
        redirect_to articles_path
    end
    def edit
    end
    def index
        @users=User.paginate(page: params[:page], per_page: 5)
    end
    def show
        @articles=@user.articles.paginate(page: params[:page], per_page: 5)
    end
    def update
        if(@user.update(user_params))
            flash[:notice]="User updated successfully"
            redirect_to @user
        else
            render 'edit'
        end
    end
    def create
        @user=User.new(user_params)
        if(@user.save)
            session[:user_id]=@user.id
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
    def require_same_user
        if @user!=current_user
            flash[:alert]="You can only edit or delete your own Profile"
            redirect_to @user
        end
    end

end