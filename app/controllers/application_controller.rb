class ApplicationController < ActionController::Base
  helper_method :current_user, :find_item

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def find_item(menu_categories_id)
    print("herer", menu_categories_id)
    # id = menu_categories_id
    # item = MenuCategoriesItem.find(id)
  end
end
