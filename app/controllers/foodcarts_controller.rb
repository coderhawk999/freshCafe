class FoodcartsController < ApplicationController
  def index
    @cart = Foodcart.find_by_user_id(current_user[:id])
  end
end
