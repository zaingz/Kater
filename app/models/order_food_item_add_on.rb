class OrderFoodItemAddOn < ActiveRecord::Base
	belongs_to :food_item_add_on
	belongs_to :order_item_food
end
