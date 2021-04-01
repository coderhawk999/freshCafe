class Orderaddcolumn < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :customer_name, :string
    add_column :orders, :phone, :text
    add_column :orders, :totalPrice, :bigint
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
