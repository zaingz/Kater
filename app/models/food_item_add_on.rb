class FoodItemAddOn < ActiveRecord::Base

  belongs_to :food_item

  validates_presence_of :name, :price

end
