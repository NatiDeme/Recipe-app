class CreateRecipeFood < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quntity
    end
     add_reference :recipe_foods, :recipes, index:true
      add_reference :recipe_foods, :foods, index:true
  end
end
