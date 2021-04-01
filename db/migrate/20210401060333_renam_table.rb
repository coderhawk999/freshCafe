class RenamTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :menu_category_items, :menu_categories_items
  end
end
