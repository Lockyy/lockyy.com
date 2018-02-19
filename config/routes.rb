Lockyy::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'bio#show'
  get '/portfolio', to: 'portfolio#show'

  get '/posts', to: 'blog#index'
  get '/posts/:category', to: 'blog#index', as: 'post_category'
  get '/posts/:category/:id', to: 'blog#show', as: 'post'

  post   'emails', to: 'email#create'
  delete 'emails', to: 'email#destroy'

  get 'unsubscribe', to: 'unsubscribe#new', as: :new_unsubscribe
end
