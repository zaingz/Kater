class Order < ActiveRecord::Base

  has_many :order_items
  belongs_to :address
  belongs_to :user
  belongs_to :catering_company


  def total
    food_item_p = self.order_items.map do |items|

      items.food_items.pluck(:price)
        end

    deal_p = self.order_items.map do |items|

      items.deals.pluck(:price)
    end


    return food_item_p.first.sum + deal_p.first.sum
  end

end
