Rails.application.routes.draw do
  get 'sessions/new'



  root 'static_pages#home'

  get 'static_pages/home'

  get 'static_pages/secret', as: 'secret'

  get 'users/new', as: 'new_user'


  get 'users/show'

  get 'users/edit'



  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end