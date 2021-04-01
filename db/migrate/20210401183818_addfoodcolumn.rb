class Addfoodcolumn < ActiveRecord::Migration[6.1]
  def change
    add_column :food_cart_items, :food_cart_id, :bigint
  end
end
