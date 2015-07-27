class OderItemDeal < ActiveRecord::Base
	belongs_to :deal
	belongs_to :order_item
end
