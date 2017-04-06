class DropColumnOnProducts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :cost
  	add_column :products, :image, :string
  end
end
