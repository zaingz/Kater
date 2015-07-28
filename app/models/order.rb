class Order < ActiveRecord::Base

  has_many :order_items
  belongs_to :address
  belongs_to :user
  belongs_to :catering_company


  def total
    

    total = 0

    self.order_items.each do |item|
       item.oder_item_foods.each do |x|
        t = 0
        x.food_item_add_ons.each do |p|
          t += p.price                    
        end
        total += (x.food_item.price+t) * x.quanitiy
       end    
    end

    
    self.order_items.each do |item|      
       item.oder_item_deals.each do |x|        
        total += (x.deal.price) * x.quanitiy
       end   
    end




    return total
  end

end
