Rails.application.routes.draw do
  devise_for :users

  root 'users#index'
  get '/users', to: 'users#index', as: 'users'
  # get '/recipes', to: 'recipes#index', as: 'recipes'
  # get '/recipes/:id', to: 'recipes#show', as: 'recipes_detail'
  # get '/recipe_foods/new/:id', to: 'recipe_foods#new', as: 'new_recipe_food'
  # post '/recipe_foods', to: 'recipe_foods#create', as: 'create_ing'
  delete '/recipe/remove/:id', to: 'recipes#remove', as: 'food_recipe_remove'
  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # get '/foods', to: 'foods#index'
  # get '/foods/new', to: 'foods#new'

  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index new create show destroy] do
    resources :recipe_foods, only: %i[new create]
  end
  resources :public_recipes, only: %i[index], as: 'public_recipes'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
