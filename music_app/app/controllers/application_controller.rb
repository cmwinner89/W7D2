class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    private

    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def log_in_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    def log_out_user!

        if logged_in?
            current_user.reset_session_token!
        end

        session[:session_token] = nil
        current_user = nil
    end

    # If we try to do a 'locked' action, must log in first
    def require_logged_in!
        redirect_to new_session_url if current_user.nil?
    end

    # Need to log out before we can sign up a new user
    # def require_logged_out!
    #     redirect_to user
    # end
end
