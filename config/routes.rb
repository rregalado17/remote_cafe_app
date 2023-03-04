Rails.application.routes.draw do
  
  root "pages#home"
  get 'admin' => 'admin#index'
  controller :sessions do 
    get 'login' => :new 
    post 'login' => :create
    delete 'logout' => :destroy 
  end

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  get '/signup' => "users#new"
  post '/signup' => "users#create"
  resources :reviews
  resources :users
  resources :cafes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
