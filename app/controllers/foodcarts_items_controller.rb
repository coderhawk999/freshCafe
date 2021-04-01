class FoodcartsItemsController < ApplicationController
  def new
    @food_cart = Foodcart.find_by_user_id(current_user[:id])
  end

  def index
    @food_cart = Foodcart.find_by_user_id(session[:user_id])
    @food_cart_items = @food_cart.foodcarts_items.build
  end

  def create
    @food_cart = Foodcart.find_by_user_id(current_user[:id])
    @food_cart_items = @food_cart.food_cart_items.build.create()
  end

  private

  def menu_items_params
    params.require(:menu_categories_item).permit(:name, :price, :description, :menu_category_id, :is_available)
  end
end
