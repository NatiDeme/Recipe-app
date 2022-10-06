class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = RecipeFood.where(recipes_id: params[:id])
  #   puts 'sdasdasdasda'
  #   puts params[:id]
  #  @shopping_lists.each do |shopping_list|
  #     puts shopping_list.foods.name
  #   end
  #   puts 'sdsdsdsds'
    # RecipeFood.includes([:foods]).where(recipes_id: params[:id])
    # @shopping_lists.each do |shopping_list|
    #   shopping_list.food.name
    # end
  end
end
