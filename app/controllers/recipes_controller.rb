class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def public
    @recipes = Recipe.where(public: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:notice] = 'Recipe was successfully created'
      redirect_to recipes_path
    else
      flash[:alert] = 'Recipe was not created'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe was successfully deleted'
    redirect_to recipes_path
  end

  def update
    @recipe = Recipe.find(params[:id])
    @public = @recipe.public ? false : true
    Recipe.update(@recipe.id, public: @public)
    redirect_to recipe_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cooking_time, :preparation_time, :description, :public)
  end
end
