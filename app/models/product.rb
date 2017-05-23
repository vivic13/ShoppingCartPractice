class Product < ApplicationRecord
	validates_presence_of :name, :price, :quantity
	has_many :cart_products, :dependent => :destroy
	has_many :carts, :through => :cart_products
	has_many :order_products
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	



end
