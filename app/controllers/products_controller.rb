class ProductsController < ApplicationController
	before_action :find_product, except: [:index]
	def index
		@products = Product.all
	end

	
	def show 
	


	end

	def add_to_cart
		current_cart.add_product_in_cart(@product)

	end 

	def remove
		current_cart.remove_product_in_cart(@product)

		
		redirect_to :back

	end


	
	private

	def find_product
			@product = Product.find(params[:id])
	end

end
