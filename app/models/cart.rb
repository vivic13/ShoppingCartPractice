class Cart < ApplicationRecord
	has_many :cart_products, :dependent => :destroy
	has_many :products, :through => :cart_products
	
	def add_product_in_cart(product)


		@my_item = self.cart_products.find_by_product_id(product.id)
		if @my_item
			@my_item.quantity += 1
			@my_item.save
		else 
			@my_item = self.cart_products.create(:product => product,:cart => self, :quantity => 1 )
		end
	end
	
	
	def total_quantity
		self.cart_products.map{ |p| p.quantity }.sum
	end


	

end
