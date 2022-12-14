class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, dependent: :delete_all, foreign_key: 'recipes_id'
end
