Rails.application.routes.draw do
 
  devise_for :users
	resources :products do 
		member do
      post :add_to_cart
      post :remove
    end
	end
	
	resources :orders

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
