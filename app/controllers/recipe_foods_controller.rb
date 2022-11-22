class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.where(user_id: current_user.id)
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = Recipe.find(params[:recipe_id]).id
    if @recipe_food.save
      flash[:notice] = 'Recipe food was successfully created'
    else
      flash[:alert] = 'Recipe food was not created'
    end
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    flash[:notice] = 'Recipe food was successfully deleted'
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @foods = Food.where(user_id: current_user.id)
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_food_params)
      flash[:notice] = 'Recipe food was successfully updated'
    else
      flash[:alert] = 'Recipe food was not updated'
    end
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
