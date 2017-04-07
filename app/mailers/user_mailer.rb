class UserMailer < ApplicationMailer

default :from => "meettheworldvivc@gmail.com"




  def order_success

    mail :to => order.user.email,
    		:subject => "訂購成功"	
  end
end
