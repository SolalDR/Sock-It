class Payment < ApplicationRecord
  has_one :shopping_cart
  belongs_to :user
end
