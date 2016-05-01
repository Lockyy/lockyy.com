Lockyy::Application.routes.draw do

  root 'bio#show'
  get '/portfolio', to: 'portfolio#show'

  get '/posts', to: 'blog#index'
  get '/posts/:category', to: 'blog#index', as: 'post_category'
  get '/posts/:category/:id', to: 'blog#show', as: 'post'

end
