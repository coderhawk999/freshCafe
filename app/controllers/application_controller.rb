class ApplicationController < ActionController::Base
  before_action :store_return_to
  helper_method :current_user, :store_return_to

  def store_return_to
    session[:return_to] = request.referer
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
