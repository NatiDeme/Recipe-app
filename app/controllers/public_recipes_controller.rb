class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes([:user], [:recipe_foods]).where(public: true)
  end
end
