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

  def adminAuth
    if !current_user.is_admin
      redirect_to unauthorised_path
    else
      return
    end
  end

  def cafeAuth
    if !current_user.is_admin && !current_user.is_clirk
      redirect_to unauthorised_path
    else
      return
    end
  end

  def clerkAuth
    if !current_user.is_clirk
      redirect_to unauthorised_path
    else
      return
    end
  end

  def loggedIn
    if session[:user_id]
      if current_user.is_admin?
        return "application"
      elsif current_user.is_clirk
        return "clerkLayout"
      else
        return "customerLayout"
      end
    else
      return "loginLayout"
    end
  end
end
