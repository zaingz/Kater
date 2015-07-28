class OrderItem < ActiveRecord::Base

  belongs_to :order


  has_many :oder_item_foods
  has_many :food_items,  through: :oder_item_foods
  has_many :oder_item_deals
  has_many :deals, through: :oder_item_deals

end