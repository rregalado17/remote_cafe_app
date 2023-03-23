class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action  :set_query
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

    def set_query
        @query = Cafe.ransack(params[:q])
    end
end
