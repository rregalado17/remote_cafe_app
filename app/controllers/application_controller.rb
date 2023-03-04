class ApplicationController < ActionController::Base
    before_action :authorize 
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_login 
        if !logged_in?
            flash[:alert] = "You need to be logged in to perform this action"
            redirect_to login_path
        end
    end

    protected 
    def authorize 
        # unless User.find_by(id: session[user_id])
        #     redirect_to login_url, notice: "Please log in"
        # end
    end 

end
