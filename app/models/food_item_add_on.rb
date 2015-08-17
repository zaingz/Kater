class FoodItemAddOn < ActiveRecord::Base

	attr_accessor :food_item_id

	belongs_to :food_item

	validates_presence_of :name, :price

	 validates :price, numericality: { greater_than_or_equal_to: 1 }

end
