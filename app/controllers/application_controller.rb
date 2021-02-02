class ApplicationController < ActionController::Base
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to '/'
        end
    end

    def redirect_if_not_tasker
        user_st = current_user.tasker
        if !user_st
            redirect_to '/projects/index'
        end
    end

    
    
end
