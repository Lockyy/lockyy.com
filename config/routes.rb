Lockyy::Application.routes.draw do
  root "static_pages#bio"
  match '/portfolio',    to: "static_pages#portfolio",      via: 'get'

  
end
