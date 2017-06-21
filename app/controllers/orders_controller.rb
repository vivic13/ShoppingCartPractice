class OrdersController < ApplicationController
	before_action :authenticate_user!

	def index
		 @orders = current_user.orders.order("id DESC")
	end

	def show
		@order = current_user.orders.find( params[:id] )
	end

	def new
		if current_cart.cart_products.empty?
      flash[:alert] = "請至少加入ㄧ樣商品"
      redirect_to root_path
    end

    @cart_products = current_cart.cart_products.page(params[:page]).per(8)

    @order = Order.new

	end

	def create
		@order = Order.new(order_params)
		@order.user = current_user
		@order.add_product_to_order(current_cart)
			if @order.save 
				#UserMailer.order_success(@order).deliver_now
				
				current_cart.destroy
      	session[:cart_id] = nil
      	redirect_to order_path(@order)
			else 
				render :new
			end

	end

	def checkout_pay2go
		@order = current_user.orders.find( params[:id] )

		if @order.paid?
			redirect_to :back, alert: 'already paid!'
		else
			@payment = Payment.create!( :order => @order,:payment_method => params[:payment_method],
                                  :amount => @order.amount )
			render :layout => false
		end
	end

	private

  def order_params
    params.require(:order).permit(:name, :phone, :address, :payment_method, :shipping_method, :amount, :status)
  end



end
