class RecipeFoodsController < ApplicationController
  before_action :set_recipe_params
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @me = params.require(:recipe_food).permit(:food_id)
    @food = Food.find_by(id: @me['food_id'])
    @recipe_food.recipes = @recipe
    @recipe_food.foods = @food
    @recipe_food.save!
    redirect_to recipe_path(@recipe.id)
  end

  private

  def set_recipe_params
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end
end
