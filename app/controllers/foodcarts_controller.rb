class FoodcartsController < ApplicationController
  def index
    @cart = Foodcart.find_by_user_id(current_user[:id])
  end

  def mycart
    @cart = Foodcart.find_by_user_id(current_user[:id])
    @foodcarts_item = FoodcartsItem.new
    @menu_categories = MenuCategory.where(is_active: true)
    @items = MenuCategoriesItem.all
  end
end
