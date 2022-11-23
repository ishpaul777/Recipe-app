class ShoppingListController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.where(user_id: current_user.id)
    @recipe_foods = @recipe.recipe_foods
    @shopping_list = []
    @total_items = 0
    @total_price = 0
    @recipe_foods.each do |recipe_food|
      # if the food is not in the food list, add it to the shopping list with price and quantity
      if !@foods.include?(recipe_food.food)
        @total_items += 1
        @total_price += recipe_food.food.price
        @shopping_list << { food: recipe_food.food.name, units: recipe_food.food.units, price: recipe_food.food.price,
                            quantity: recipe_food.quantity }
      elsif @foods.include?(recipe_food.food)
        food = @foods.find(recipe_food.food.id)
        if food.quantity < recipe_food.quantity
          @total_items += 1
          @total_price += recipe_food.food.price
          @shopping_list << { food: recipe_food.food.name, units: recipe_food.food.units,
                              price: recipe_food.food.price, quantity: recipe_food.quantity - food.quantity }
        end
      end
    end
  end

  def new
    @shopping_list = []
    redirect_to recipe_shopping_list_index_path
  end
end
