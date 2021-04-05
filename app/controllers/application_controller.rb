class ApplicationController < ActionController::Base
  layout :loggedIn
  helper_method :current_user, :store_return_to

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def loggedIn
    if session[:user_id]
      if current_user.is_admin?
        return "application"
      else
        return "clerkLayout"
      end
    else
      return "loginLayout"
    end
  end
end
