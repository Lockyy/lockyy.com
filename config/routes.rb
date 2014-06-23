Lockyy::Application.routes.draw do

	#Casein routes
	namespace :casein do
		resources :images
		resources :sections
		resources :items
		resources :bios
	end


  root 'static_pages#bio'
  get '/portfolio', to: 'static_pages#portfolio'

end
