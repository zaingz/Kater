class CateringCompany < ActiveRecord::Base

  has_many :food_items
  has_many :deals
  has_many :ratings
  has_many :orders
  has_many :inavailabilities
  belongs_to :user

  validates_presence_of :name, :description,  :number_of_employes,  :contact_number,
                        :address, :city, :state, :country
  validates_uniqueness_of :name, :contact_number



end
