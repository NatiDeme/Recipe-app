Rails.application.routes.draw do
  get 'recipes/index'
  devise_for :users
  root 'users#index'
  get '/users', to: 'users#index', as: 'users'
  get '/recipes', to: 'recipes#index', as: 'recipes'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
