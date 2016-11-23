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

require 'test_helper'

class ShoppingCartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
