class Address < ActiveRecord::Base
  belongs_to :user

  has_many :orders

  validates_presence_of :full_name, :street_address, :city, :country, :user

end
