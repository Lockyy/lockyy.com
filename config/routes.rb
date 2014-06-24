Lockyy::Application.routes.draw do

	#Casein routes
	namespace :casein do
		resources :images
		resources :sections
		resources :items
		resources :bios
	end


  root 'bio#show'
  get '/portfolio', to: 'portfolio#show'

end
