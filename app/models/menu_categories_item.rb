class MenuCategoriesItem < ApplicationRecord
  belongs_to :menu_category
  has_one :foodcarts_items
end
