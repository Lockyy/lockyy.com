Lockyy::Application.routes.draw do

  root 'static_pages#bio'
  get '/portfolio', to: 'static_pages#portfolio'

end
