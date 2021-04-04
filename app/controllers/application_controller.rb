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
      return "application"
    else
      return "loginLayout"
    end
  end
end
