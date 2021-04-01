class OrdersController < ApplicationController
  def new
    @order = Order.new
    @test = "test"
    @items = MenuCategoriesItem.all
  end

  def index
    @orders = Order.all
  end

  def create
    print(params)
  end

  def add_order_item
    session["user_cart".to_sym] = "item"
  end

  private

  def order_params
    params.require(:order).permit(:status, :totalPrice, :user_id, orders_items_attributes: [:id, :order_id, :quantity, :menu_categories_item_id])
  end

  def create_walkin_order
    user = User.find_by_email("walkin@freshcafe.com")
    order = Order.new
    order[:user_id] = user[:id]
    order[:totalPrice] = 0
    order
  end
end
