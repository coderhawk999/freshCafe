class OrdersController < ApplicationController
  def new
    @cart = Foodcart.find_by_user_id(current_user[:id])
    @foodcarts_item = FoodcartsItem.new
    @items = MenuCategoriesItem.all
  end

  def index
    @orders = Order.all
  end

  def checkout
    @cart = Foodcart.find_by_user_id(current_user[:id])
    @foodcarts_item = FoodcartsItem.new
    @items = MenuCategoriesItem.all
  end

  def create
    @order = Order.new
    @cart = Foodcart.find_by_user_id(current_user[:id])
    @totalPrice = 0
    @cart.foodcarts_items.each do |x|
      @totalPrice = @totalPrice + (x.menu_categories_item.price * x.quantity)
    end
    @order[:user_id] = session[:user_id]
    @order[:totalPrice] = @totalPrice
    @order[:completed] = false

    if @order.save
      @cart.foodcarts_items.each do |x|
        @orders_item = OrdersItem.new
        @orders_item[:order_id] = @order.id
        @orders_item[:menu_categories_item_id] = x.menu_categories_item_id
        @orders_item[:quantity] = x.quantity
        @orders_item.save
      end

      clear_cart
    end
  end

  def add_order_item
    @cart = Foodcart.find_by_user_id(current_user[:id])
    @current_item = FoodcartsItem.find_by(foodcart_id: @cart.id, menu_categories_item_id: params[:foodcarts_item][:menu_categories_item_id])

    if @current_item
      @current_item[:quantity] = @current_item.quantity + 1
      @current_item.update(cart_params)
      redirect_to new_order_path
    else
      @foodcarts_item = FoodcartsItem.new(cart_params)
      @foodcarts_item[:quantity] = 1

      if @foodcarts_item.save
        redirect_to new_order_path
      end
    end
  end

  def clear_cart
    @cart = Foodcart.find_by_user_id(current_user[:id])
    @cart_items = @cart.foodcarts_items.find_by(foodcart_id: @cart.id)
    @cart.foodcarts_items.destroy_all
    redirect_to new_order_path
  end

  private

  def order_params
    params.require(:order).permit(:status, :totalPrice, :user_id, orders_items_attributes: [:id, :order_id, :quantity, :menu_categories_item_id])
  end

  def cart_params
    params.require(:foodcarts_item).permit(:menu_categories_item_id, :foodcart_id, :quantity)
  end

  def create_walkin_order
    user = User.find_by_email("walkin@freshcafe.com")
    order = Order.new
    order[:user_id] = user[:id]
    order[:totalPrice] = 0
    order
  end
end
