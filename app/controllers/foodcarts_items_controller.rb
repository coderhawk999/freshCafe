class FoodcartsItemsController < ApplicationController
  before_action :get_cart

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

  def destroy
    @food_cart_item = @food_cart.foodcarts_items.find(params[:id])
    @food_cart_item.destroy
    redirect_to new_order_path
  end

  def increment_item
    @food_cart_item = @food_cart.foodcarts_items.find_by(foodcart_id: @food_cart.id, menu_categories_item_id: params[:foodcarts_item][:menu_categories_item_id])
    @food_cart_item[:quantity] = @food_cart_item.quantity + 1
    @food_cart_item.update(cart_params)
    redirect_to new_order_path
  end

  def decrement_item
    @food_cart_item = @food_cart.foodcarts_items.find_by(foodcart_id: @food_cart.id, menu_categories_item_id: params[:foodcarts_item][:menu_categories_item_id])
    if (@food_cart_item[:quantity] == 1)
      @food_cart_item.destroy
    else
      @food_cart_item[:quantity] = @food_cart_item.quantity - 1
      @food_cart_item.update(cart_params)
    end
    redirect_to new_order_path
  end


  def increment_cart_item
    @food_cart_item = @food_cart.foodcarts_items.find_by(foodcart_id: @food_cart.id, menu_categories_item_id: params[:foodcarts_item][:menu_categories_item_id])
    @food_cart_item[:quantity] = @food_cart_item.quantity + 1
    @food_cart_item.update(cart_params)
    redirect_to new_order_path
  end

  def decrement_cart_item
    @food_cart_item = @food_cart.foodcarts_items.find_by(foodcart_id: @food_cart.id, menu_categories_item_id: params[:foodcarts_item][:menu_categories_item_id])
    if (@food_cart_item[:quantity] == 1)
      @food_cart_item.destroy
    else
      @food_cart_item[:quantity] = @food_cart_item.quantity - 1
      @food_cart_item.update(cart_params)
    end
    redirect_to new_order_path
  end

  private

  def menu_items_params
    params.require(:menu_categories_item).permit(:name, :price, :description, :menu_category_id, :is_available)
  end

  def cart_params
    params.require(:foodcarts_item).permit(:menu_categories_item_id, :foodcart_id)
  end

  def get_cart
    @food_cart = Foodcart.find_by_user_id(current_user[:id])
  end
end
