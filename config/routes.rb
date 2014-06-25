Lockyy::Application.routes.draw do

	#Casein routes
	namespace :casein do
		resources :blog_posts
		resources :blog_categories
		resources :images
		resources :sections
		resources :items
		resources :bios
	end


  root 'bio#show'
  get '/portfolio', to: 'portfolio#show'

  get '/posts', to: 'blog#index'
  get '/posts/:category', to: 'blog#index', as: 'post_category'
  get '/posts/:category/:id', to: 'blog#show', as: 'post'

end
