Lockyy::Application.routes.draw do

  #Casein routes
  namespace :casein do
    resources :images
    resources :bios
    resources :items
    resources :sections
  end

  root "static_pages#bio"
  match '/portfolio',    to: "static_pages#portfolio",      via: 'get'

  unless Rails.env.development?
  	get '*path' => redirect('/')
  end

end
