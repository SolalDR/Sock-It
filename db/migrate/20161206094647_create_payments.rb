class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|

      t.string :fact_firstname
      t.string :fact_lastname
      t.string :fact_address
      t.string :fact_adresscomplement
      t.string :fact_adresscomplementbis
      t.string :fact_zipcode
      t.string :fact_city

      t.string :deliver_firstname
      t.string :deliver_lastname
      t.string :deliver_adress
      t.string :deliver_adresscomplement
      t.string :deliver_adresscomplementbis
      t.string :deliver_zipcode
      t.string :deliver_city

      t.integer :total_price

      t.timestamps
    end
  end
end
