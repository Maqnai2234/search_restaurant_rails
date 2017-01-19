class Zone < ApplicationRecord
  belongs_to :restaurant
  belongs_to :city
  has_many :phones
end
