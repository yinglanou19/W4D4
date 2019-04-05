class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :logged_in?

    def logged_in?
        !self.current_user.nil?
    end

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        if self.current_user
            self.current_user.reset_session_token!
            session[:session_token] = nil
        end
    end
end
