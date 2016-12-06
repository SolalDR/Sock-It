class AddReferencesPayments < ActiveRecord::Migration[5.0]
  def change
    add_reference(:shopping_carts, :payment, foreign_key: true)
    add_reference(:payments, :user, foreign_key: true)
  end
end
