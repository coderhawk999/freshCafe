class SessionsController < ApplicationController
  layout "loginLayout"

  def new
  end

  def create
    @user = User.find_by_email(params["/login".to_sym][:email])
    if @user && @user.authenticate(params["/login".to_sym][:password])
      session[:user_id] = @user.id

      if @user.is_admin
        respond_to do |format|
          format.html { redirect_to users_path, success: "Logged In, Welcome back #{@user.name}" }
        end
      elsif @user.is_clirk
        respond_to do |format|
          format.html { redirect_to orders_path, success: "Logged In, Welcome back #{@user.name}" }
        end
      else
        respond_to do |format|
          format.html { redirect_to myorders_orders_path, success: "Logged In, Welcome back #{@user.name}" }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to login_path, alert: "Invalid Password or Email Address" }
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
