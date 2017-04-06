class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    	t.string :name
    	t.integer :phone
    	t.string :address
    	t.string :payment_method , :default => "credit_card"
    	t.string :shipping_method, :default => "home_delivery"
    	t.string :status
    	t.integer :amount
    	t.integer :user_id,:index => true
      t.timestamps
    end
  end
end
