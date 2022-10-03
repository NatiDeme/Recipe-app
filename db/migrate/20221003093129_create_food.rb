class CreateFood < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurment_unit
      t.decimal :price 
      t.integer :quantity 
    end
    add_reference :foods, :user, index:true
  end
end
