class CreateMenuCategoryItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_category_items do |t|
      t.string :name
      t.bigint :price
      t.text :description
      t.boolean :is_available

      t.timestamps
    end
  end
end
