Rails.application.routes.draw do
 
  devise_for :users
	resources :products do 
		member do
      post :add_to_cart
      post :remove
    end
	end
	get '/aboutus', to: 'home#about', :controller => 'home'
  get '/contactus', to: 'home#contact', :controller => 'home'
	
	resources :orders do 
		member do
      post :checkout_pay2go
    end
	end 

	post 'pay2go/return'
  post 'pay2go/notify'

	root :to => "products#index"

	namespace :admin do
  	resources :products
	end
	
	scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
  	resources :products
	end

	if Rails.env.development?
  	mount LetterOpenerWeb::Engine, at: "/letter_opener"
	end

end
