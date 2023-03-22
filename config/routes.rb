Rails.application.routes.draw do


  get '/item', to: 'items#index'
  get '/item/:id', to: 'items#show' 
  post '/item', to: 'items#create'
  delete '/items/:id', to: 'items#destroy'

  patch '/editItemForm/:id', to: 'items#update'
  

  post '/adminLogin', to: 'admin_sessions#create'
  delete '/logout', to: 'admin_sessions#destroy'

  post '/adminSignUp', to: 'admin_users#create'
  get "/adminUser", to: "admin_users#show"

  post '/signup', to: 'users#create'

end
