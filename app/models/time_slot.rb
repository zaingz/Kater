class TimeSlot < ActiveRecord::Base
  has_one :inavailability
  belongs_to :catering_company

end
