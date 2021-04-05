class OrdersController < ApplicationController
  def new
    cafeAuth
    @cart = Foodcart.find_by_user_id(current_user[:id])
    @foodcarts_item = FoodcartsItem.new
    @menu_categories = MenuCategory.where(is_active: true)
    @items = MenuCategoriesItem.all
  end

  def updateStatus
    @order = Order.find(params[:id])
  end

  def update
    cafeAuth
    @order = Order.find(params[:id])
    if params[:completed] == "Completed"
      @order[:completed] = true
    else
      @order[:completed] = false
    end
    @order.update(order_params)
    redirect_to orders_path
  end

  def index
    cafeAuth
    @completedOrders = Order.where(completed: true)
    @orders = Order.all
  end

  def myorders
    @completedOrders = Order.where(completed: true)
    @orders = Order.where(user_id: session[:user_id])
  end

  def walkinOrder
    cafeAuth
    session[:cart] ||= {}
    @cart = Foodcart.find_by_user_id(current_user[:id])
    @foodcarts_item = FoodcartsItem.new
    @items = MenuCategoriesItem.all
  end

  def checkout
    @cart = Foodcart.find_by_user_id(current_user[:id])
    @foodcarts_item = FoodcartsItem.new
    @items = MenuCategoriesItem.all
    @totalPrice = 0
    @cart.foodcarts_items.each do |x|
      @totalPrice = @totalPrice.to_i + (x.menu_categories_item.price.to_i * x.quantity.to_i)
    end
  end

  def create
    @order = Order.new
    @cart = Foodcart.find_by_user_id(current_user[:id])
    @totalPrice = 0
    @cart.foodcarts_items.each do |x|
      @totalPrice = @totalPrice.to_i + (x.menu_categories_item.price.to_i * x.quantity.to_i)
    end
    @order[:user_id] = session[:user_id]
    @order[:totalPrice] = @totalPrice
    @order[:completed] = false
    if current_user.is_admin || current_user.is_clirk
      @order[:is_walkin] = true
    else
      @order[:is_walkin] = false
    end

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

 

  def FoodMenu
    @cart = Foodcart.find_by_user_id(current_user[:id])
    @foodcarts_item = FoodcartsItem.new
    @menu_categories = MenuCategory.where(is_active: true)
    @items = MenuCategoriesItem.all
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

        if !current_user.is_admin && !current_user.is_clirk
          redirect_to home_Food_Menu_path
        else
          redirect_to new_order_path
        end
      end
    end
  end

  def clear_cart
    @cart = Foodcart.find_by_user_id(current_user[:id])
    @cart_items = @cart.foodcarts_items.find_by(foodcart_id: @cart.id)
    @cart.foodcarts_items.destroy_all
    if request.path == new_order_path
      if !current_user.is_admin && !current_user.is_clirk
        redirect_to home_Food_Menu_path
      else
        redirect_to new_order_path
      end
    else
      if !current_user.is_admin && !current_user.is_clirk
        redirect_to myorders_orders_path
      else
        redirect_to new_order_path
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:completed, :totalPrice, :user_id, :is_walkin,:id)
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
