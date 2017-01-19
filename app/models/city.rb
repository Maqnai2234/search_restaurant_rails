class City < ApplicationRecord
  has_many :zones
  validates :name, uniqueness: true
  has_many :restaurants, through: :zones
end
