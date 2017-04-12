class UserMailer < ApplicationMailer

default :from => "meettheworldvivc@gmail.com"




  def order_success(order)
  	@order = order
    mail :to => @order.user.email, :subject => "訂購成功"	
  end
end
