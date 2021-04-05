class SessionsController < ApplicationController
  layout "loginLayout"
  def new
  end

  def create
    @user = User.find_by_email(params["/login".to_sym][:email])
    if @user && @user.authenticate(params["/login".to_sym][:password])
      session[:user_id] = @user.id

      if @user.is_admin
        redirect_to users_path
      elsif @user.is_clirk
        redirect_to orders_path
      else
        redirect_to myorders_orders_path
      end
    end
  end

  def login
  end

  def unauthorized
  end

  def destroy
    session[:user_id] = nil 
    redirect_to login_path
  end
end
