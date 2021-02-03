class ApplicationController < ActionController::Base
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
        if !logged_in?
            flash[:notice] = "You be logged in before accessing this page!"
            redirect_to '/'
        end
    end

    def redirect_if_not_tasker
        user_st = current_user.tasker
        if !user_st
            flash[:notice] = "You are not a Tasker!"
            redirect_to '/projects/index'
        end
    end

    
    
end
