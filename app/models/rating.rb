class Rating < ActiveRecord::Base
  belongs_to :catering_company
  belongs_to :user
end
