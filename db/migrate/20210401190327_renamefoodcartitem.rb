class Renamefoodcartitem < ActiveRecord::Migration[6.1]
  def change
    rename_column :food_cart_items, :food_cart_id, :foodcart_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
