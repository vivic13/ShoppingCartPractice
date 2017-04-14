class ApiV1::ProductsController < ApiController

	def index 
		#@products = Product.all
		@xx = request.headers.to_h["abc"]
		render json: @xx
	end

	def show 
		@product = Product.find(params[:id])
		render :json => { :id => @product.id, :name => @product.name }
	end


end
