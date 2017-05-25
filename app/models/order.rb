class Order < ApplicationRecord
	validates_presence_of :name, :phone, :address, :payment_method, :shipping_method
	belongs_to :user
	has_many :order_products
	has_many :payments

	def add_product_to_order(cart)
		cart.cart_products.each do |p|
			self.order_products.build(:product_id => p.product_id, :quantity => p.quantity, :price => p.product.price)
		end
		self.amount = self.order_products.map{|a| a.quantity * a.price}.sum
		self.status = "new"
	end

	def paid?
		self.status == "Paid"
	end
end
