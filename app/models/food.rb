class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, foreign_key: :post_id, dependent: :delete_all

  validates :measurement_unit, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
