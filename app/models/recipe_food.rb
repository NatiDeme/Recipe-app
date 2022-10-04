class RecipeFood < ApplicationRecord
    belongs_to :recipes, foreign_key: 'recipe_id'
    belongs_to :foods, foreign_key: 'food_id'
end
