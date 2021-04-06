class User < ApplicationRecord
  has_many :orders
  has_one :food_cart
  has_secure_password
  validates :name, :phone, presence: true

end
