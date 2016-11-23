# == Schema Information
#
# Table name: shopping_cart_items
#
#  id             :integer          not null, primary key
#  owner_id       :integer
#  owner_type     :string
#  quantity       :integer
#  item_id        :integer
#  item_type      :string
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ShoppingCartItem < ApplicationRecord
  acts_as_shopping_cart_item
end
