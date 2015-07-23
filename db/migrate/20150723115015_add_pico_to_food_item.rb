class AddPicoToFoodItem < ActiveRecord::Migration
  def change
    add_column :food_items, :pico, :string
  end
end
