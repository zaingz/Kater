class CateringCompany < ActiveRecord::Base
  include ApplicationHelper
  has_many :food_items
  has_many :deals
  has_many :ratings
  has_many :orders
  has_many :inavailabilities
  has_many :time_slots
  belongs_to :user

  validates_presence_of :name, :description,  :number_of_employes,  :contact_number

  validates_uniqueness_of :name

  def available_time_slots date
    temp = self.inavailabilities.where('date != ?', date).pluck(:time_slot_id)
    temp.append(-1)
    self.time_slots.where('id not in (?)', temp)

    
  end

  
  mount_uploader :pico, PicoUploader

  before_save :trim_city

  def trim_city
    self.city = self.city.strip
  end

  def food_items_with_in_range low=-Float::INFINITY, high=+Float::INFINITY
    self.food_items.where('price <= ? or price >= ?', low, high)

  end
end
