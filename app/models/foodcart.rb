class Foodcart < ApplicationRecord
  belongs_to :user
  has_many :foodcarts_items, dependent: :destroy
  has_many :menu_categories_items, through: :foodcarts_items
end
