class Payment < ApplicationRecord
  has_one :shopping_cart
end
