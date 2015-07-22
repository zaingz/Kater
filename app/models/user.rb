class User < ActiveRecord::Base

  has_many :addresses
  has_many :ratings
  has_many :orders
  has_one :catering_company



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :level

end
