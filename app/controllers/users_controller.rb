class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def signup
    @user = User.new
  end

  def newsignup
    @user = User.new(user_params)
    @user[:is_admin] = false
    @user[:is_clirk] = false

    if @user.save
      redirect_to login_path
    end
  end

  def create
    if params[:user][:is_admin] == "Admin"
      params[:user][:is_admin] = true
      params[:user][:is_clirk] = false
    elsif params[:user][:is_admin] == "Clerk"
      params[:user][:is_admin] = false
      params[:user][:is_clirk] = true
    end
    @user = User.new(user_params)
    print(@user)
    
    @foodcart = Foodcart.new

    if @user.save
      @foodcart[:user_id] = @user.id
      if @foodcart.save
        redirect_to users_path
      end
    end
  end

  def show
    @users = User.all
  end

  private

  def singup_params
    params.permit(:name, :email, :password, :is_admin, :phone)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :is_admin,:phone, :is_clirk)
  end
end
