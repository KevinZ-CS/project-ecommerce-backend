Rails.application.routes.draw do

  
  get '/item', to: 'items#index'
  get '/item/:id', to: 'items#show' 
  post '/item', to: 'items#create'


  post '/adminSignUp', to: 'admin_users#create'


end
