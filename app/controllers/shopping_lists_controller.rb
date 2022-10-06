class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = Food.all
    @shopping_lists.each do |shopping_list|
      shopping_list.food.name
    end
  end
end
