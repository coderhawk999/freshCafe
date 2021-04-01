class Renamefood < ActiveRecord::Migration[6.1]
  def change
    rename_table :food_cart_items, :foodcarts_items
  end
end
