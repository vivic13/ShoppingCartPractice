class ProductsController < ApplicationController
	before_action :find_product, except: [:index]
	
	def index
		@page_title = "純產品"
		@products = Product.order('created_at desc').page(params[:page]).per(12)
	end


	def add_to_cart
		current_cart.add_product_in_cart(@product)
		redirect_to :back

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
