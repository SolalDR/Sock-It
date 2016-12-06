class AddAdressToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :lastname
      t.string :firstname
      t.string :addresscomplement
      t.string :addresscomplementbis
    end
  end
end
