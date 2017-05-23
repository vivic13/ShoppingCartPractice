class AddColumnsOnProduct < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :volume, :integer
  	add_column :products, :volume_type, :string ,:default => "ML"
  	add_column :products, :location , :string
  	add_column :products, :code, :integer
  	add_column :products, :expiry_date, :date
  	add_column :products, :usage, :text
  	add_column :products, :description, :text
  end
end
