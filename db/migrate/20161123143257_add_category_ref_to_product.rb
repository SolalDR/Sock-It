class AddCategoryRefToProduct < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :products, :category, index: true
  end
end
