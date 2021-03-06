class Admin::ProductsController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin
	before_action :find_product, only:[:show, :edit, :update, :destroy]

	def index 
		@products = Product.all
	end

	def show

	end

	def new
		@product = Product.new
	end



	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admin_product_path(@product)
		else 
			render :new
		end
	end

	def edit

	end
	def update
		if @product.update(product_params)
			redirect_to admin_product_path(@product)
		else
			render :edit
		end

	end

	def destroy
		@product.destroy
		redirect_to admin_products_path

	end

	private

	def product_params
		params.require(:product).permit(:name, :price, :image, :quantity, :volume, :volume_type, :location, :code, :expiry_date, :usage, :description)
	end


  def find_product
  	@product = Product.find(params[:id])
  end

  def authenticate_admin
	  unless current_user.admin?
	    flash[:alert] = "Not allow!"
	    redirect_to root_path
	  end
	end

end
