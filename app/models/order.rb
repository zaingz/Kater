class Order < ActiveRecord::Base

  has_many :order_items
  has_one :address
  belongs_to :user
  belongs_to :catering_company

end
