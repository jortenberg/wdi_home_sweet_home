Rails.application.routes.draw do

  # route--------controller

  root 'session#new'

  get '/login' => 'session#new'
  post '/session' => 'session#create'
  delete '/session' => 'session#destroy'

  # get '/main' => 'main#index'

  get 'users/new' => 'users#new'
  get 'users' => 'users#index'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show'
  put 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

  get 'houses/new' => 'houses#new'
  get 'houses' => 'houses#index'
  post 'houses' => 'houses#create'
  get 'houses/:id' => 'houses#show'
  put 'houses/:id' => 'houses#update'
  delete 'houses/:id' => 'houses#destroy'

  get 'clients' => 'clients#index'
  post 'clients' => 'clients#create'
  get 'clients/:id' => 'clients#show'
  put 'clients/:id' => 'clients#update'
  delete 'clients/:id' => 'clients#destroy'

end
