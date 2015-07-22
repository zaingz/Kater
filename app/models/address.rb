class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :order

  validates_presence_of :full_name, :street_address, :city, :state, :country, :zip_code, :user

end
