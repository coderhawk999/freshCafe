class Removerefcol < ActiveRecord::Migration[6.1]
  def change
    remove_column :food_cart_items, :user_id
  end
end
