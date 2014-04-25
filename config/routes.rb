Lockyy::Application.routes.draw do

  #Casein routes
  namespace :casein do
    resources :images
    resources :bios
    resources :items
    resources :sections
  end

  root 'static_pages#bio'
  get '/portfolio', to: 'static_pages#portfolio'

end
