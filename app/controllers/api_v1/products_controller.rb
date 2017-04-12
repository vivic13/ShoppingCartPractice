class ApiV1::ProductsController < ApiController

	def index 
		@products = Product.all
	end

	def show 
		@product = Product.find(params[:id])
		render :json => { :id => @product.id, :name => @product.name }
	end


end
