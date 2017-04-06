class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
    	t.integer :quantity
    	t.integer :price
    	t.integer :order_id, :index => true
    	t.integer :product_id, :index => true
      t.timestamps
    end
  end
end
