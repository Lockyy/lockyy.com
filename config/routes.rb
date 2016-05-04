Lockyy::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'bio#show'
  get '/portfolio', to: 'portfolio#show'

  get '/posts', to: 'blog#index'
  get '/posts/:category', to: 'blog#index', as: 'post_category'
  get '/posts/:category/:id', to: 'blog#show', as: 'post'

  post '/subscribe', to: 'subscribe#email', as: 'submit_email'

end
