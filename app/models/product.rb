class Product < ApplicationRecord
	validates_presence_of :name, :price, :quantity
	has_many :cart_products, :dependent => :destroy
	has_many :carts, :through => :cart_products
	has_many :order_products
	
	
	



end
