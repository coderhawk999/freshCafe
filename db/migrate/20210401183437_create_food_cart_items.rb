class CreateFoodCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :food_cart_items do |t|
      t.bigint :quantity
      t.bigint :menu_categories_item_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
