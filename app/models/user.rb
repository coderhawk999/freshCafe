class User < ApplicationRecord
  has_many :orders
  has_one :food_cart
  has_secure_password
end
