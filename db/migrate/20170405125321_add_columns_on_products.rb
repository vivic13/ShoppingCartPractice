class AddColumnsOnProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :cost, :integer
  	add_column :products, :quantity, :integer
  end
end
