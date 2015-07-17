class Deal < ActiveRecord::Base


	attr_accessor :catering_company_id, :food_item_id

	has_and_belongs_to_many :food_items
	belongs_to :catering_company



end
