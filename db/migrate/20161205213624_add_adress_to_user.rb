class AddAdressToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :adresscomplement
      t.string :adresscomplementbis
    end
  end
end
