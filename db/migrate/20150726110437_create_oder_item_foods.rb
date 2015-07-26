class CreateOderItemFoods < ActiveRecord::Migration
  def change
    create_table :oder_item_foods do |t|
    	t.belongs_to :order_item
    	t.belongs_to :food_item
    	t.integer :quanitiy, default: 1
    	t.timestamps null: false
    end
  end
end
