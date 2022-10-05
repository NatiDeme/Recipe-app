class RecipeFoodsController < ApplicationController
    before_action :set_recipe_params 
    def new
        @recipe_food = RecipeFood.new 
        @foods = Food.all
    end
    def create 
        @recipe_food = RecipeFood.new(recipe_food_params)
        @recipe_food.recipe_id = @recipe.id 
        if @recipe_food.save
            redirect_to recipes_path
        end
    end
    

    private

    def set_recipe_params 
        puts id
        @recipe = Recipe.find(params[:id]) 
    end 

    def recipe_food_params 
        params.require(:recipe_food).permit(:quantity, :food_id)
    end 
end
