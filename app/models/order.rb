class Order < ActiveRecord::Base

  has_many :order_items
  belongs_to :address
  belongs_to :user
  belongs_to :catering_company

end
