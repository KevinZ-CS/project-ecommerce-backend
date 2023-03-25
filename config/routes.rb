Rails.application.routes.draw do

  # get '/items', to: 'items#index'
  # get '/items/:id', to: 'items#show' 
  # post '/items', to: 'items#create'
  # delete '/items/:id', to: 'items#destroy'

  patch '/editItemForm/:id', to: 'items#update'
  

  post '/adminLogin', to: 'admin_sessions#create'
  delete '/adminLogout', to: 'admin_sessions#destroy'

  post '/userLogin', to: 'user_sessions#create'
  delete '/userLogout', to: 'user_sessions#destroy' 

  post '/adminSignUp', to: 'admin_users#create'
  get "/adminUser", to: "admin_users#show"

  post '/signup', to: 'users#create'
  get '/user', to: 'users#show'

  resources :items, only: [:index, :show, :create, :destroy] do
    resources :reviews, only: [:update, :destroy, :create, :show]
  end


end
