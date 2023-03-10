Rails.application.routes.draw do
  
  get '/item', to: 'items#index'
  post '/item', to: 'items#create'


end
