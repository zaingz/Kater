class CateringCompany < ActiveRecord::Base

  has_many :food_items
  has_many :deals
  has_many :ratings
  has_many :orders
  has_many :inavailabilities
  has_many :time_slots
  belongs_to :user

  validates_presence_of :name, :description,  :number_of_employes,  :contact_number,

  validates_uniqueness_of :name

  def available_time_slots
    temp = self.inavailabilities.pluck(:time_slot_id)
    temp.append(-1)
    self.time_slots.where('id not in (?)', temp)

    
  end

  
  mount_uploader :pico, PicoUploader

end
