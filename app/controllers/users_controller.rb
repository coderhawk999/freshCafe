class UsersController < ApplicationController
  def index
    adminAuth
    @users = User.where.not(id: session[:user_id])
  end

  def new
    adminAuth
    @user = User.new
  end

  def signup
    if is_loggedIn?
      if current_user.is_admin || current_user.is_clirk
        redirect_to orders_path
      else
        redirect_to home_Food_Menu_path
      end
    end

    @user = User.new

  end

  def newsignup
    @user = User.new(user_params)
    @user[:is_admin] = false
    @user[:is_clirk] = false
    @foodcart = Foodcart.new

    if @user.save
      @foodcart[:user_id] = @user.id
      if @foodcart.save
        redirect_to login_path
      end
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

def update
  @user = User.find(session[:user_id])
    if @user.update(update_attributes)
      flash[:alert] = "Updated."
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "Something went wrong"
      redirect_to :back
    end
end

  def create
    adminAuth
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
    adminAuth
    @users = User.all
  end

  def destroy
    adminAuth
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def singup_params
    params.permit(:name, :email, :password, :is_admin, :phone)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :is_admin, :phone, :is_clirk)
  end


  def update_attributes
    params.require(:user).permit(:name, :email, :password, :phone)
  end
end
