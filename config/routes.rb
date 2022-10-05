Rails.application.routes.draw do
   devise_for :users

  root 'users#index'
  get '/users', to: 'users#index', as: 'users'
  # get '/recipes', to: 'recipes#index', as: 'recipes'
  # get '/recipes/:id', to: 'recipes#show', as: 'recipes_detail'

  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # get '/foods', to: 'foods#index'
  # get '/foods/new', to: 'foods#new'

  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index new create show destroy]
  resources :recipe_foods, only: %i[new create]
  resources :public_recipes, only: %i[index], as: 'public_recipes'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
