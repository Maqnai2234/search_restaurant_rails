class City < ApplicationRecord
  has_many :zones
  validates :name, uniqueness: true 
end
