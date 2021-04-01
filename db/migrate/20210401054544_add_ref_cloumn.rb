class AddRefCloumn < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_category_items, :menu_category_id, :bigint
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
