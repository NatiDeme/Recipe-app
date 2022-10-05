class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods 
  end
  def new
    @recipe = Recipe.new
  end
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.valid?
      @recipe.save
      flash[:notice] = 'New Recipe Created Successfully'
      redirect_to recipes_path
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Successfully removed the Recipe.'
  end

  private

  def recipe_params
    params.require(:recipe).permit!
  end
end
