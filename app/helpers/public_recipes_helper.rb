module PublicRecipesHelper
  def price(recipe)
    sum = 0
    recipe.recipe_foods.each do |ingredient|
      food = Food.find(ingredient.food_id)
      sum += food.price * ingredient.quantity
    end
    sum
  end
end
