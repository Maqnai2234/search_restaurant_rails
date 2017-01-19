class Restaurant < ApplicationRecord
  validates :name, :image,:speciality, presence: true
  mount_uploader :image, ImageUploader
  has_many :zones
  belongs_to :speciality
end
