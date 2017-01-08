# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShoppingCart < ApplicationRecord
  acts_as_shopping_cart
  def tax_pct
    0
  end
  belongs_to :payments
end
