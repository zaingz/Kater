class FoodItem < ActiveRecord::Base

	belongs_to :catering_company
	has_many :food_item_add_ons
	has_and_belongs_to_many :deals
	belongs_to :order_item

	attr_accessor :add_ons



	validates_presence_of :name, :description, :price, :catering_company
	 validates :price, numericality: { greater_than_or_equal_to: 1 }

	accepts_nested_attributes_for :food_item_add_ons

	mount_uploader :pico, PicoUploader
end
