class OrdersItem < ApplicationRecord
  belongs_to :order, class_name: "order", foreign_key: "order_id"
  # belongs_to :menu_categories_item, class_name: "menu_categories_item", foreign_key: "menu_categories_item_id"
end
