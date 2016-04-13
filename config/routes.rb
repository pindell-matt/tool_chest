Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :tools
  resources :users, only: [:new, :create, :show]
  resources :categories, only: [:show, :index], param: :name

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
