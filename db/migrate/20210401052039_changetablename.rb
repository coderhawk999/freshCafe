class Changetablename < ActiveRecord::Migration[6.1]
  def change
    rename_table :menu_catogaries, :menu_categories
  end
end
