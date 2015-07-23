class CateringCompany < ActiveRecord::Base

  has_many :food_items
  has_many :deals
  has_many :ratings
  has_many :orders
  has_many :inavailabilities
  has_many :time_slots
  belongs_to :user

  validates_presence_of :name, :description,  :number_of_employes,  :contact_number,
                        :address, :city, :state, :country
  validates_uniqueness_of :name, :contact_number

  def available_time_slots
    self.time_slots.where.not('id not in (?)', self.inavailabilities.pluck(:time_slot_id))
  end
  mount_uploader :pico, PicoUploader

end
