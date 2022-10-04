Rails.application.routes.draw do
   devise_for :users

  root 'users#index'
  get '/users', to: 'users#index', as: 'users'
  get '/recipes', to: 'recipes#index', as: 'recipes'
  get '/recipes/:id', to: 'recipes#show', as: 'recipes_detail'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
