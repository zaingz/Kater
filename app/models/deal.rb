class Deal < ActiveRecord::Base

  has_and_belongs_to_many :food_items
  belongs_to :catering_company

end
