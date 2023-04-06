Rails.application.routes.draw do

namespace :api do
  post '/adminLogin', to: 'admin_sessions#create'
  delete '/adminLogout', to: 'admin_sessions#destroy'

  post '/userLogin', to: 'user_sessions#create'
  delete '/userLogout', to: 'user_sessions#destroy' 

  post '/addToCart', to: 'carts#create'
  delete '/removeFromCart/:id', to: 'carts#delete'
  get '/orders', to: 'orders#index'

  post '/adminSignUp', to: 'admin_users#create'
  get "/adminUser", to: "admin_users#show"

  post '/signup', to: 'users#create'
  get '/user', to: 'users#show'

  post '/checkout', to: 'checkout_session#create'
  post '/webhook', to: 'webhook#create'

  resources :items, only: [:index, :show, :create, :destroy] do
    resources :reviews, only: [:update, :destroy, :create, :show]
  end

  patch '/editItemForm/:id', to: 'items#update'

  delete '/reviews/:id', to: 'reviews#destroy'

end


end
