class RecipeFood < ApplicationRecord
  belongs_to :recipes, class_name: 'Recipe'
  belongs_to :foods, class_name: 'Food'
end
