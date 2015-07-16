class FoodItemAddOn < ActiveRecord::Base

	attr_accessor :food_item_id

	belongs_to :food_item

	validates_presence_of :name, :price

end
