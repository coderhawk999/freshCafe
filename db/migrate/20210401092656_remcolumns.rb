class Remcolumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :phone
    remove_column :orders, :customer_name
  end
end
