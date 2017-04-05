Rails.application.routes.draw do
 
  devise_for :users
	resources :products

	root :to => "products#index"

	namespace :admin do
  	resources :products
	end
end
