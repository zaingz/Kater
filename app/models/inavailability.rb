class Inavailability < ActiveRecord::Base
  belongs_to :time_slot
  belongs_to :catering_company
  has_one :order
end


