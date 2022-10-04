Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  # get '/foods', to: 'foods#index'
  # get '/foods/new', to: 'foods#new'

  resources :foods, only: %i[index new create destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
