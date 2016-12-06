class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|

      t.string :fact_firstname
      t.string :fact_lastname
      t.string :fact_address
      t.string :fact_addresscomplement
      t.string :fact_addresscomplementbis
      t.string :fact_zipcode
      t.string :fact_city

      t.string :deliver_firstname
      t.string :deliver_lastname
      t.string :deliver_address
      t.string :deliver_addresscomplement
      t.string :deliver_addresscomplementbis
      t.string :deliver_zipcode
      t.string :deliver_city

      t.integer :total_price

      t.timestamps
    end
  end
end
