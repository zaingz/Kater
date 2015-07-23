class FoodItem < ActiveRecord::Base

	belongs_to :catering_company
	has_many :food_item_add_ons
	has_and_belongs_to_many :deals
	belongs_to :order_item

	validates_presence_of :name, :description, :price, :catering_company

	accepts_nested_attributes_for :food_item_add_ons

	mount_uploader :pico, PicoUploader
end
