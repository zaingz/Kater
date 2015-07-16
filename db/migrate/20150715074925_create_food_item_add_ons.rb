class CreateFoodItemAddOns < ActiveRecord::Migration
  def change
    create_table :food_item_add_ons do |t|
      t.string :name, null: false, default: ""
      t.references :food_item
      t.float :price, null: false

      t.timestamps null: false
    end
  end
end
