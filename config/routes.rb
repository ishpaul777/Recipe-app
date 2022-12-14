Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#  define root root to sign in page

# Defines the routes for the "foods" page
resources :foods
# defines the routes for the "recipes" page
resources :recipes
# defines the routes for the "public_recipes" page having the public recipes
resources :recipes do
  resources :shopping_list
  resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
end

root "recipes#public"
get "/public_recipes", to: "recipes#public", as: "public_recipes"
end
