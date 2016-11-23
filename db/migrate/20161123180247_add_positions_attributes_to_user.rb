class AddPositionsAttributesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address, :string
    add_column :users, :zipcode, :integer
    add_column :users, :city, :string
  end
end
