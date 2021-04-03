class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params["/login".to_sym][:email])
    if @user && @user.authenticate(params["/login".to_sym][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    end
  end

  def login
  end
end
