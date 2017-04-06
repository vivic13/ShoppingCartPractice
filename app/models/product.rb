class Product < ApplicationRecord
	validates_presence_of :name, :price, :quantity
	has_many :cart_products, :dependent => :destroy
	has_many :carts, :through => :cart_products

	def find_product_in_cart
		Cart_product.find_by(:product => self, :cart => current_cart)
	end



end
