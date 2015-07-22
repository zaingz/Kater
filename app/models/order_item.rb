class OrderItem < ActiveRecord::Base

  has_one :food_item
  has_one :deal
  belongs_to :order

end
