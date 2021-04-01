class CreateOrdersItems < ActiveRecord::Migration[6.1]
  def change
    create_table :orders_items do |t|
      t.bigint :order_id
      t.bigint :menu_categories_item_id

      t.timestamps
    end
  end
end
