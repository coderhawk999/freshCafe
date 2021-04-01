class Foodcart < ApplicationRecord
  belongs_to :user
  has_many :foodcarts_items
end
