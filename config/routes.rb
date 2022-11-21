Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#  define root root to sign in page
  
  # Defines the routes for the "foods" page
  resources :foods, only: [:index, :new, :create, :destroy]
  # defines the routes for the "recipes" page
  resources :recipes
  # defines the routes for the "public_recipes" page
  resources :public_recipes

  # root to: "foods#index"
  root 'foods#index'

end
