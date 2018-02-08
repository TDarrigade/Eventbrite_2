Rails.application.routes.draw do
  
  get 'sessions/new'



  root 'static_pages#home'

  get 'static_pages/home'

  get 'static_pages/secret', as: 'secret'

  get 'users/new', as: 'new_user'


  get 'users/show'

  get 'users/edit'

  get 'events/index', as: 'event'

  get 'events/show', as: 'show'

  get 'events/new', as: 'new'

get "events/suscribe/:id", to: "events#suscribe"
  get "events/:id/:id", to: "events#adduser"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :events
end