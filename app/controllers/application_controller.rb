class ApplicationController < ActionController::Base
  layout :loggedIn
  helper_method :current_user, :store_return_to, :is_loggedIn?, :show_flash

  def show_flash(options = {})
    options = { :fade => 1, :display => 2, :highlight => 3 }.merge(options)
    html = content_tag(:div, flash.collect { |key, msg| content_tag(:div, msg, :class => key, :attributes => "style = display: none;") }, :id => "flash-message")
    html << content_tag(:script, "new Effect.Highlight('flash-message', {duration: #{options[:highlight]}});") if options[:highlight]
    html << content_tag(:script, "setTimeout(\"$('flash-message').fade({duration: #{options[:fade]}});\", #{options[:display] * 1000}); return false;")
  end

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

  def is_loggedIn?
    !current_user.nil?
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
