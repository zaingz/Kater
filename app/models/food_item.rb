class FoodItem < ActiveRecord::Base



	attr_accessor :catering_company_id, :deal_id, :food_item_add_on_id

	belongs_to :catering_company
	has_many :food_item_add_ons
	has_and_belongs_to_many :deals


	validates_presence_of :name, :description, :price, :catering_company

end
