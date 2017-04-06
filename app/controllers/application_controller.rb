class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart

   def current_cart
    if session[:cart_id]
      @cart = Cart.find_by_id(session[:cart_id])
      return @cart if @cart
  
    else
	    @cart = Cart.create
	    session[:cart_id] = @cart.id

	    return @cart

    end
	end

end
