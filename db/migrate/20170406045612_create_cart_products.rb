class CreateCartProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_products do |t|
    	t.integer :product_id
    	t.integer :cart_id
    	t.integer :quantity
    	t.integer :cart_id, :index => true
    	t.integer :product_id, :index => true

      t.timestamps


    end

  end
end
