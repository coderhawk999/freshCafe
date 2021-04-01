class FoodcartsItem < ApplicationRecord
  belongs_to :foodcart
  belongs_to :menu_categories_item
end
