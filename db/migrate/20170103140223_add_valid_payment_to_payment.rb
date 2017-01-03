class AddValidPaymentToPayment < ActiveRecord::Migration[5.0]
  def change
    change_table :payments do |t|
      t.boolean :complete, :default => false
    end
  end
end
