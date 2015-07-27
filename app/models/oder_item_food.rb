class OderItemFood < ActiveRecord::Base
	has_many :order_food_item_add_ons
	has_many :food_item_add_ons, through: :order_food_item_add_ons

	belongs_to :food_item
	belongs_to :order_item
end
