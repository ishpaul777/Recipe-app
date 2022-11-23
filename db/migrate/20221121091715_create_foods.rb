class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :units
      t.decimal :price
      t.decimal :quantity

      t.timestamps
    end
  end
end
