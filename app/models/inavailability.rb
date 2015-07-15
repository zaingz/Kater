class Inavailability < ActiveRecord::Base
  has_one :time_slot
  belongs_to :catering_company
end
