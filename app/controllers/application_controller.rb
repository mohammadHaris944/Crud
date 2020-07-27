class ApplicationController < ActionController::Base
    #methods written in application controller available in all controller not in views

    helper_method :current_user, :logged_in?

    def current_user            #to available it in views we write it as helper 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]   #if current_user is not nill then it will return current nill otherwise get user from database
    end

    def logged_in?
        !!current_user  #it will return true or false
    end
    def require_user
        if !logged_in?
            flash[:alert]="You must be logged in"
            redirect_to login_path
        end
    end
end
