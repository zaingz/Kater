class User < ActiveRecord::Base

  has_many :addresses
  has_many :ratings
  has_one :catering_company

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :mobile_number1,
      :birthdate, :occupation, :gender, :level

end
