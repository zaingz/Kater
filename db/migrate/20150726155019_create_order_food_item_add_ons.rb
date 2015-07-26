class CreateOrderFoodItemAddOns < ActiveRecord::Migration
  def change
    create_table :order_food_item_add_ons do |t|
    	t.belongs_to :oder_item_food
    	t.belongs_to :food_item_add_on
      	t.timestamps null: false
    end
  end
end
