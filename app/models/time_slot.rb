class TimeSlot < ActiveRecord::Base
  belongs_to :inavailability
  belongs_to :catering_company

end
