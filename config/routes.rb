Rails.application.routes.draw do
  
  get 'admin/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root "pages#home"
  resources :reviews
  resources :users
  resources :cafes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
