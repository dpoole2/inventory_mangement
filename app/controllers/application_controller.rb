class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :authorize_user

    private
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorize_user
        if !current_user.present?
            #Kick them off to log in page
            redirect_to log_in_path
        end
    end
end
